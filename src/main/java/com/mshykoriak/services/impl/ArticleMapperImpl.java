package com.mshykoriak.services.impl;

import com.mshykoriak.dto.ArticleDto;
import com.mshykoriak.entity.Article;
import com.mshykoriak.entity.Tag;
import com.mshykoriak.repository.TagRepository;
import com.mshykoriak.services.ArticleMapper;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
@Transactional
public class ArticleMapperImpl implements ArticleMapper {

    private TagRepository tagRepository;
    @Override
    public ArticleDto toDto(Article article) {
        ArticleDto articleDto = new ArticleDto();
        articleDto.setId(article.getId());
        articleDto.setTitle(article.getTitle());
        articleDto.setDescription(article.getDescription());
        articleDto.setContent(article.getContent());
        articleDto.setDateCreated(article.getDateCreated());
        articleDto.setDatePublished(article.getDatePublished());
        articleDto.setDateUpdated(article.getDateUpdated());
        articleDto.setInDraft(article.isInDraft());

        if (article.getTags() != null) {
            articleDto.setTags(article.getTags().stream().sorted()
                    .map(Tag::getName)
                    .reduce("", (s1, s2) -> s1.concat(" ").concat(s2)));
        }
        return articleDto;
    }

    @Override
    public Article toEntity(ArticleDto articleDto) {
        Article article = new Article();
        article.setId(articleDto.getId());
        article.setTitle(articleDto.getTitle());
        article.setDescription(articleDto.getDescription());
        article.setContent(articleDto.getContent());
        article.setDateCreated(articleDto.getDateCreated());
        article.setDatePublished(articleDto.getDatePublished());
        article.setDateUpdated(articleDto.getDateUpdated());
        article.setInDraft(articleDto.isInDraft());

        for(String tag: articleDto.getTags().trim().split(" ")) {
            Tag entity = tagRepository.findByName(tag);
            if (entity == null) {
                entity = new Tag(tag, Set.of(article));
            } else {
                entity.getArticles().add(article);
            }
            article.getTags().add(entity);
        }
        return article;
    }

    @Autowired
    public void setTagRepository(TagRepository tagRepository) {
        this.tagRepository = tagRepository;
    }
}
