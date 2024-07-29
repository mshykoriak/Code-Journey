package com.mshykoriak.repository;

import com.mshykoriak.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * This is a simple repository for CRUD operations over article entity.
 *
 * @author Misha Shykoriak
 */
@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {
}
