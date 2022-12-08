

model1 <- glm(score ~ ., data = anime, family = "binomial")
summary.glm(model1)
