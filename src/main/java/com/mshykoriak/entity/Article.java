package com.mshykoriak.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.util.Date;

@Entity
public class Article {

    @Id
    @GeneratedValue()
    private Long id;
    @NotBlank(message = "Name is required")
    @Column(nullable = false)
    private String name;
    @NotBlank(message = "Description is required")
    @Column(nullable = false)
    private String description;
    @NotBlank(message = "Content is required")
    @Column(nullable = false)
    private String content;
    @Column(nullable = false)
    private Date created = new Date();
    private boolean draft = true;

    public Article() {
    }

    public Article(String name, String description, String content) {
        this.name = name;
        this.description = description;
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public boolean isDraft() {
        return draft;
    }

    public void setDraft(boolean draft) {
        this.draft = draft;
    }
}
