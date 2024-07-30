package com.mshykoriak.services;

import com.mshykoriak.entity.Article;

import java.util.List;
import java.util.Optional;

/**
 * This is an interface for crud operations over article entity.
 *
 * @author Misha Shykoriak
 */
public interface ArticleService {

    void saveArticle(Article article);
    List<Article> getAllArticles();
    Optional<Article> getArticleById(Long id);
    Article updateArticle(Article article);
    void deleteArticle(Long id);
    void publishArticle(Long id);
    void draftArticle(Long id);

}
