package com.mshykoriak.services;

import com.mshykoriak.dto.ArticleDto;
import com.mshykoriak.entity.Article;

public interface ArticleMapper {

    public ArticleDto toDto(Article article);
    public Article toEntity(ArticleDto articleDto);

}
