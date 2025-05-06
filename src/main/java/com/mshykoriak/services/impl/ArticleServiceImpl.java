package com.mshykoriak.services.impl;

import com.mshykoriak.dto.ArticleDto;
import com.mshykoriak.entity.Article;
import com.mshykoriak.repository.ArticleRepository;
import com.mshykoriak.services.ArticleMapper;
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
    private ArticleMapper articleMapper;

    @Override
    public void publishArticle(Long id) {
        Article article = getArticleById(id).orElseThrow();
        article.setInDraft(false);
        article.setDatePublished(new Date());
    }

    @Override
    public void draftArticle(Long id) {
        Article article = getArticleById(id).orElseThrow();
        article.setInDraft(true);
        article.setDatePublished(null);
    }

    @Override
    public void saveArticle(Article article) {
        if (article.getDateCreated() == null) {
            article.setDateCreated(new Date());
        }
        if (article.getDatePublished() != null && article.isInDraft()) {
            article.setDatePublished(null);
        }
        if (!article.isInDraft() && article.getDatePublished() == null) {
            article.setDatePublished(new Date());
        }
        article.setDateUpdated(new Date());
        repository.save(article);
    }

    @Override
    public void saveArticle(ArticleDto articleDto) {
        Article article = articleMapper.toEntity(articleDto);
        saveArticle(article);
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

    @Autowired
    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }
}
