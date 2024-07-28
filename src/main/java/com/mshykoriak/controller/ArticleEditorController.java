package com.mshykoriak.controller;

import com.mshykoriak.entity.Article;
import com.mshykoriak.services.ArticleService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * This controller should be used by admin to Add/Edit/Delete articles.
 * @author Misha Shykoriak
 */
@Controller
public class ArticleEditorController {
    private static final String ADD_ARTICLE_PAGE = "addArticle";
    private ArticleService articleService;

    @PostMapping("/admin/articles/edit")
    public String addArticle(@Valid @ModelAttribute("article") Article article, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()) {
            return ADD_ARTICLE_PAGE;
        }
        articleService.createArticle(article);
        return "redirect:/articles?id=" + article.getId();
    }

    @GetMapping("/admin/articles/edit")
    public String addEditArticle(@RequestParam(name = "id", required = false) Long id, Model model) {
        Article article = null;
        if (id != null) {
            article = articleService.getArticleById(id).orElseThrow();
        } else {
            article = new Article();
        }
        model.addAttribute("article", article);
        return ADD_ARTICLE_PAGE;
    }

    @GetMapping("/admin/articles/publish")
    public String publishArticle(@RequestParam(name = "id") Long id, Model model) {
        articleService.publishArticle(id);
        return "redirect:/admin/articles";
    }

    @GetMapping("/admin/articles")
    public String showEditArticles(Model model) {
        List<Article> articles = articleService.getAllArticles();
        articles.sort((Comparator.comparing(Article::getDateCreated).reversed()));

        model.addAttribute("articlesList", articles);
        return "admin/articles";
    }

    @GetMapping("/articles")
    public String readArticle(@RequestParam(name = "id") Long id, Model model) {
        Article article = articleService.getArticleById(id).orElseThrow();
        model.addAttribute("article", article);
        return "article";
    }

    @Autowired
    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
}
