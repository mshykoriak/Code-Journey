package com.mshykoriak.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
public class Article {

    @Id
    @GeneratedValue()
    private Long id;
    @NotBlank(message = "Name is required")
    @Size(min = 10, max = 100, message = "Name field length must be in range from 10 characters to 100")
    private String name;
    @NotBlank(message = "Description is required")
    @Size(min = 10, max = 100, message = "Description field length must be in range from 10 characters to 100")
    private String description;
    @NotBlank(message = "Content is required")
    private String content;
    private Date created = new Date();

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

}
