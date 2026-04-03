#Load R built-in Orange dataset
data(Orange)
View(Orange)

#Scatterplot: showing growth of trees
plot(Orange$age, Orange$circumference,
     xlab = "Age(days)",
     ylab = "Circumference",
     main = "Orange Tree Growth",
     col = "orange",
     pch = 19)

#LineGraph: growth by trees
tree1 = filter(Orange, Tree==1)

plot(tree1$age, tree1$circumference,
     type = "o",
     col = "darkgreen",
     xlab = "Age(days",
     ylab = "Circumference",
     main = "Growth of Tree 1")

tree2 = filter(Orange, Tree==2)

plot(tree2$age, tree2$circumference,
     type = "o",
     col = "darkgreen",
     xlab = "Age(days",
     ylab = "Circumference",
     main = "Growth of Tree 2")

tree3 = filter(Orange, Tree==3)

plot(tree3$age, tree3$circumference,
     type = "o",
     col = "darkgreen",
     xlab = "Age(days",
     ylab = "Circumference",
     main = "Growth of Tree 3")

tree4 = filter(Orange, Tree==4)

plot(tree4$age, tree4$circumference,
     type = "o",
     col = "darkgreen",
     xlab = "Age(days",
     ylab = "Circumference",
     main = "Growth of Tree 4")

tree5 = filter(Orange, Tree==5)

plot(tree5$age, tree5$circumference,
     type = "o",
     col = "darkgreen",
     xlab = "Age(days",
     ylab = "Circumference",
     main = "Growth of Tree 5")

