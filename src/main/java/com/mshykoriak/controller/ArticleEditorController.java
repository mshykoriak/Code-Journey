package com.mshykoriak.controller;

import com.mshykoriak.entity.Article;
import com.mshykoriak.services.ArticleService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * This controller should be used by admin to Add/Edit/Delete articles.
 * @author Misha Shykoriak
 */
@Controller
public class ArticleEditorController {
    private static final String ADD_ARTICLE_PAGE = "addArticle";
    private static final String SUCCESS_PAGE = "success";

    private ArticleService articleService;

    @GetMapping("/")
    public String welcome(Model model) {
        model.addAttribute("article", new Article());
        return ADD_ARTICLE_PAGE;
    }

    @PostMapping("/addArticle")
    public String addArticle(@Valid @ModelAttribute("article") Article article, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()) {
            return ADD_ARTICLE_PAGE;
        }
        articleService.createArticle(article);
        model.addAttribute("content", article.getContent());
        return SUCCESS_PAGE;
    }

    @Autowired
    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
}
