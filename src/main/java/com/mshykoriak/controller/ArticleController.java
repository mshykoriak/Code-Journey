package com.mshykoriak.controller;

import com.mshykoriak.dto.ArticleDto;
import com.mshykoriak.entity.Article;
import com.mshykoriak.services.ArticleMapper;
import com.mshykoriak.services.ArticleService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * This controller provides endpoints that should be used by admin to Add/Edit/Delete articles.
 * @author Misha Shykoriak
 * @since 1.0
 */
@Controller
public class ArticleController {

    private ArticleService articleService;
    private ArticleMapper articleMapper;

    @PostMapping("/admin/articles/edit")
    public String addArticle(@Valid @ModelAttribute("article") ArticleDto article, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()) {
            return "addArticle";
        }

        articleService.saveArticle(articleMapper.toEntity(article));
        return "redirect:/admin/articles";
    }

    @GetMapping("/admin/articles/edit")
    public String addEditArticle(@RequestParam(name = "id", required = false) Long id, @RequestParam(name = "continue", required = false) String continueParam, Model model) {
        Article article = null;
        if (id != null) {
            article = articleService.getArticleById(id).orElseThrow();
        } else {
            article = new Article();
        }

        model.addAttribute("article", articleMapper.toDto(article));
        return "addArticle";
    }

    @GetMapping("/admin/articles/publish")
    public String publishArticle(@RequestParam(name = "id") Long id) {
        articleService.publishArticle(id);
        return "redirect:/admin/articles";
    }

    @GetMapping("/admin/articles/draft")
    public String draftArticle(@RequestParam(name = "id") Long id) {
        articleService.draftArticle(id);
        return "redirect:/admin/articles";
    }

    @GetMapping("/admin/articles")
    public String showEditArticles(Model model) {
        List<Article> articles = articleService.getAllArticles();
        List<ArticleDto> articleDtos = new ArrayList<>();
        articles.forEach(article -> articleDtos.add(articleMapper.toDto(article)));
        articleDtos.sort((Comparator.comparing(ArticleDto::getDateCreated).reversed()));

        model.addAttribute("articlesList", articleDtos);
        return "admin/articles";
    }

    @GetMapping("/article")
    public String showArticle(@RequestParam(name = "id") Long id, Model model) {
        Article article = articleService.getArticleById(id).orElseThrow();
        model.addAttribute("article", article);
        return "article";
    }

    @Autowired
    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    @Autowired
    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }
}
