# Ruby-Chess

## Live demo

https://replit.com/@nguyenlekhtn/Ruby-Chess-1#replit.nix

## Usage

**To play on local**: Clone this repo then cd into and

* `bundle install` to install gems
* `ruby main.rb` to run the game

**To play on Replit**: Click Run button in the my Replit site. It might takes a minute to load some commands related to replit and bundle


## What I applied in this project

+ OOP concept (inheritance, polymorphism, ...)
+ OOP principle(Single Responsibility, ...)
+ TDD
+ Refactoring
  
## Overview of classes in this program

**Controller**: Control general gameplay and save/ load function

**Game**: Manage state a game. 

**HalfGame**: Manage gameplay of a half-move. A half-move is the move of a player in a round. 

**Pieces**: Manage properties of pieces and indicates what moves it can do via #neighbor_generator

**Generators**: Return a set of valid moves after filtering a initial set of moves

**Moves**: Represent a move with methods that indicates the effect of that move on game state.

# Chess features that is missing
* En Passant
* Rule related to the number of moves

## Background

I learned Ruby from The Odin Project's Ruby in Rail path. And this [Chess project](https://www.theodinproject.com/lessons/ruby-ruby-final-project) is the final project of the Ruby section. It's the capstone project that required me to use all my gained programming knowledge to finish it.

I don't know how long it took others to complete it. For me, I used to decide to quit when I was in a difficult situation and need to apply for a dev job ( and actually got one). I planned to move forward to Rail section. But then I see others in TOP discord, who does the Ruby path like me, can complete it.  So I decided to come back and continue this project. But the time to complete this is still very long because I have to do my job too. But I did it: I completed the project!.






