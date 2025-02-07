package com.company.model;

import java.util.List;

public class FoodRecommendation {
    private String name;
    private String description;
    private String image;
    private List<String> tags;

    public FoodRecommendation(String name, String description, String image, List<String> tags) {
        this.name = name;
        this.description = description;
        this.image = image;
        this.tags = tags;
    }

    // Getters and setters
    public String getName() { return name; }
    public String getDescription() { return description; }
    public String getImage() { return image; }
    public List<String> getTags() { return tags; }
}
