

#---section 6

movies <- read.csv(file.choose())
head(movies)
colnames(movies) <- c("film","genre","criticrating","audiencerating","budget","year")
head(movies)
tail(movies)
str(movies)
movies$genre <- as.factor(movies$genre)
str(movies)
summary(movies)
movies$year <- 
as.factor(movies$year)
summary(movies)




#    aesthetics

library(ggplot2)


ggplot(data=movie, aes(x=criticrating, y=audiencerating))


#  add geometry

ggplot(data=movies, aes(x=criticrating, y=audiencerating)) +
  geom_point()

# add color

ggplot(data=movies, aes(x=criticrating, y=audiencerating, 
                        color=genre)) +
  geom_point()


# add size
ggplot(data=movies, aes(x=criticrating, y=audiencerating, 
                        color=genre, size=genre)) +
  geom_point()



# add size - better way

ggplot(data=movies, aes(x=criticrating, y=audiencerating, 
                        color=genre, size=budget)) +
  geom_point()

# plotting with layers

# using "+" to add a layer to ggplot graphics

p <- ggplot(data=movies, aes(x=criticrating, y=audiencerating, 
                             color=genre, size=budget))
p + geom_smooth()


# point
p + geom_point()

# lines
p + geom_line()

# multiple layers

p + geom_point() + geom_line()

p + geom_line()+ geom_point() 




# overriding aesthetics

q <- ggplot(data=movies, aes(x=criticrating, y=audiencerating, 
                             color=genre, size=budget))

# add geom layer

q + geom_point()


# overriding aes
# exp 1
q + geom_point(aes(size=(criticrating))


               
               

# exp2
q + geom_point(aes(color=budget))

q + geom_point()

# exp3

q + geom_point(aes(x=budget)) +
  xlab("budget ")


# exp3

q + geom_line() + geom_point()

#reduce line size

q + geom_line(size=0.5) + geom_point()


# mapping vs setting

r <- ggplot(data=movies, aes(x=criticrating, y=audiencerating))

r+geom_point()


# add color

# 1 mapping (what we've done so far)
r + geom_point(aes(color=genre))

# setting
r + geom_point(color="darkgreen")

# error
# r + geom_point(aes(color="darkgreen"))


# 1. mapping

r +geom_point(aes(size=budget))
# setting
r + geom_point(size=10)

# error
# r + geom_point(aes(size=10))

h <- ggplot(data=movies, aes(x=budget))
h + geom_histogram(binwidth=10)


# add color

h + geom_histogram(aes(fill=genre), binwidth=10)

# add border

h + geom_histogram(aes(fill=genre), color= "black",binwidth=10)


# sometimes you may need density charts

h + geom_density(aes(fill=genre))

h + geom_density(aes(fill=genre), position="stack")


# starting layers tips: fixed

t <- ggplot(data=movies, aes(x=audiencerating))
t + geom_histogram(binwidth=10,
                   fill="white", color="blue")
mean(movies$audiencerating)


# another way : flexible

s <- ggplot(data=movies)
s + geom_histogram(binwidth=10,
                   aes(x=audiencerating),
                   fill="grey", color="blue")


# 4

s + geom_histogram(binwidth=10,
                   aes(x=criticrating),
                   fill="grey", color="blue")



# 5

m <- ggplot()



# 6 statistical transformations


u <- ggplot(data=movies, aes(x=criticrating, y=audiencerating,
                             color=genre))
u + geom_point() + geom_smooth(fill=NA)

# boxplot

bp <- ggplot(data=movies, aes(x=genre, y=audiencerating,
             color=genre))

bp + geom_boxplot()
bp  + geom_boxplot(size=0.8) + geom_point()
bp + geom_boxplot(size=0.8) + geom_point()
# tip or hack

bp + geom_boxplot(size=0.8) + geom_jitter()

bp + geom_jitter() + geom_boxplot(size=0.8, alpha=0.5) 

bpc <- ggplot(data=movies, aes(x=genre, y=criticrating,
                               color=genre))
bpc + geom_jitter() + geom_boxplot(size=0.8, alpha=0.5) 



# using facets


fac <- ggplot(data=movies, aes(x=budget))
fac + geom_histogram(binwidth=10, aes(fill=genre),
                   color="blue")
# facets

# zzz~.(left: row)
fac + geom_histogram(binwidth=10, aes(fill=genre),
                     color="blue") +
  facet_grid(genre~., scales="free")

# .~zzz (right: column)

fac + geom_histogram(binwidth=10, aes(fill=genre),
                     color="blue") +
  facet_grid(.~genre, scales="free")



# scatterplot

sca <- ggplot(data=movies, aes(x=criticrating, y=audiencerating,
                               color=genre))
sca + geom_point(size=2)

sca + geom_point(size=2) + facet_grid(.~year)
sca + geom_point(size=1) + facet_grid(genre~year)

sca + geom_point(size=1) + 
  geom_smooth() +
  facet_grid(genre~year)


sca + geom_point(aes(size=budget)) + 
  geom_smooth() +
  facet_grid(genre~year)


#.  coordinates

# limits
# zoom coordinates

coo <- ggplot(data=movies, aes(x=criticrating, y=audiencerating,
                               color=genre,
                               size=budget))
coo + geom_point()

coo + geom_point() +
  xlim(50,100) +
  ylim(50,100)

# won't work well always

wont <- ggplot(data=movies, aes(x=budget))
wont + geom_histogram(binwidth=10, aes(fill=genre), color="black")
wont + geom_histogram(binwidth=10, aes(fill=genre), color="black") +
  ylim(0,50)

# instead - zoom

wont + geom_histogram(binwidth=10, aes(fill=genre), color="black") +
  coord_cartesian(ylim=c(0,50))


sca + geom_point(aes(size=budget),size=0.5) + 
  geom_smooth() +
  facet_grid(genre~year) +
  coord_cartesian(ylim=c(0,100)) +
  xlab("critic rating") +
  ylab("audience rating") +
  theme(axis.title.x=element_text(color="darkgreen", size=20),
        axis.title.y=element_text(color="red", size=20),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10))

#  THEME

the <- ggplot(data=movies, aes(x=budget))
h <- the + geom_histogram(binwidth=10, aes(fill=genre),color="black")


# axis label
h + 
  xlab("money axis") +
  ylab("number of movies")

# label formatting

h + 
  xlab("money axis") +
  ylab("number of movies") +
  theme(axis.title.x=element_text(color="darkgreen", size=20),
        axis.title.y=element_text(color="red", size=20))



# tick mark formatting

h + 
  xlab("money axis") +
  ylab("number of movies") +
  theme(axis.title.x=element_text(color="darkgreen", size=20),
        axis.title.y=element_text(color="red", size=20),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10))


# legend formatting
h + 
  xlab("money axis") +
  ylab("number of movies") +
  theme(axis.title.x=element_text(color="darkgreen", size=20),
        axis.title.y=element_text(color="red", size=20),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        legend.text=element_text(size=15),
        legend.title=element_text(size=20),
        legend.position=c(1,1),
        legend.justification=c(1,1))

# gg title

h + 
  xlab("money axis") +
  ylab("number of movies") +
  ggtitle("movie budget distribution") +
  theme(axis.title.x=element_text(color="darkgreen", size=20),
        axis.title.y=element_text(color="red", size=20),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        legend.text=element_text(size=15),
        legend.title=element_text(size=20),
        legend.position=c(1,1),
        legend.justification=c(1,1))




# title formattinng

h + 
  xlab("money axis") +
  ylab("number of movies") +
  ggtitle("movie budget distribution") +
  theme(axis.title.x=element_text(color="darkgreen", size=20),
        axis.title.y=element_text(color="red", size=20),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        legend.text=element_text(size=15),
        legend.title=element_text(size=20),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        plot.title = element_text(color="darkblue",
                                  size=20,
                                  family="Courier"))





# homework 6

hw6 <- read.csv(file.choose())
head(hw6)
head(hw6)
tail(hw6)
str(hw6)
hw6$Studio <- factor(hw6$Studio)
hw6$Genre <- factor(hw6$Genre)

ggplot(data=hw6, aes(x=Day.of.Week)) + geom_bar()


str(hw6)
hwfg <- (hw6$Genre=="action") | (hw6$Genre=="comedy") | (hw6$Genre=="animation") |(hw6$Genre=="adventure") | (hw6$Genre== "drama")
hwgs <- (hw6$Studio=="Buena Vista Studios") |(hw6$Studio=="Fox") | (hw6$Studio=="Paramout Pictures") | (hw6$Studio=="Sony") | (hw6$Studio=="Universal") | (hw6$Studio=="WB")
hwfg
mov2 <- hw6[hwfg & hwgs,]
mov2
mf1 <- (hw6$Genre == "action") | (hw6$Genre == "adventure") | (hw6$Genre == "animation") | (hw6$Genre == "comedy") | (hw6$Genre == "drama")

#Now let's do the same for the Studio filter:
mf2 <- hw6 %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures")

mov2 <- hw6[hw6$Genre=="mf1" & hw6$Studio=="mf2",]

str(mov2)

box1 <- ggplot(data=mov2,aes(x=Genre, y=Gross...US))
box1 + geom_jitter(aes(size=Budget...mill.,color=Studio)) + geom_boxplot(alpha=0.5, outlier.color=NA) 
 

# improve

xlab("money axis") +
  ylab("number of movies") +
  ggtitle("movie budget distribution") +
  theme(axis.title.x=element_text(color="darkgreen", size=20),
        axis.title.y=element_text(color="red", size=20),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        legend.text=element_text(size=15),
        legend.title=element_text(size=20),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        plot.title = element_text(color="darkblue",
                                  size=20,
                                  family="Courier"))


box1 <- ggplot(data=mov2,aes(x=Genre, y=Gross...US))
home <- box1 + geom_jitter(aes(size=Budget...mill.,color=Studio)) + geom_boxplot(alpha=0.5, outlier.color=NA) +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x=element_text(color="blue",size=20),
        axis.title.y=element_text(color="blue", size=20),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=15),
        legend.title=element_text(size=20),
        legend.text=element_text(size=20),
        plot.title=element_text(size=40),
        text=element_text(family="Comic Sans MS")
  )


home
home$lables$size <- "Budget $M"
home

        
        

















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































