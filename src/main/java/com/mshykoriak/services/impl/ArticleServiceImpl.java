package com.mshykoriak.services.impl;

import com.mshykoriak.entity.Article;
import com.mshykoriak.repository.ArticleRepository;
import com.mshykoriak.services.ArticleService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

    private ArticleRepository repository;


    @Override
    public void publishArticle(Long id) {
        Article article = getArticleById(id).orElseThrow();
        article.setInDraft(false);
        article.setDatePublished(new Date());
        repository.save(article);
    }

    @Override
    public void createArticle(Article article) {
        repository.save(article);
    }

    @Override
    public List<Article> getAllArticles() {
        return repository.findAll();
    }

    @Override
    public Optional<Article> getArticleById(Long id) {
        return repository.findById(id);
    }

    @Override
    public Article updateArticle(Article article) {
        return repository.save(article);
    }

    @Override
    public void deleteArticle(Long id) {
        repository.deleteById(id);
    }


    @Autowired
    public void setRepository(ArticleRepository repository) {
        this.repository = repository;
    }
}
