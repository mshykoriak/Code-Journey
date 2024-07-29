package com.mshykoriak.controller;

import com.mshykoriak.entity.Article;
import com.mshykoriak.services.ArticleService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.List;

/**
 * This controller should be used by admin to Add/Edit/Delete articles.
 * @author Misha Shykoriak
 */
@Controller
public class ArticleEditorController {

    private ArticleService articleService;

    @PostMapping("/admin/articles/edit")
    public String addArticle(@Valid @ModelAttribute("article") Article article, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()) {
            return "addArticle";
        }
        articleService.createArticle(article);
        return "redirect:/admin/articles";
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
        articles.sort((Comparator.comparing(Article::getDateCreated).reversed()));

        model.addAttribute("articlesList", articles);
        return "admin/articles";
    }

    @GetMapping("/article")
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
