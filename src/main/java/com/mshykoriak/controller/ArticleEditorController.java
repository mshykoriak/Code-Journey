package com.mshykoriak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * This controller should be used by admin to Add/Edit/Delete articles.
 * @author Misha Shykoriak
 */
@Controller
public class ArticleEditorController {

    @GetMapping
    public String addArticle() {
        return "index";
    }
}
