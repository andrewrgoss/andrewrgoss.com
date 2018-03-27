---
author: "Andrew Goss"
date: 2017-09-29
title: DOM Pig Game
tags:
  - javascript
---
<a href="https://andrewrgoss.com/udemy-complete-javascript/dom-pig-game" target="_blank"><img src="/img/projects/dom_pig_game.png" alt="DOM Pig Game"></a><br>
<a href="/2017/udemy--complete-javascript-course/">Udemy- Complete JavaScript Course</a> &gt;&gt; <b>My projects</b><br>
<hr>

Part of the <a href="/2017/udemy--complete-javascript-course/">Complete JavaScript Course</a> I completed, this project put JavaScript concepts from the section on DOM manipulation and events into practice.

#### GAME RULES:
* The game has 2 players, playing in rounds
* In each turn, a player rolls a dice as many times as he/she wishes. Each result get added to his ROUND score
* BUT, if the player rolls a 1, all his/her ROUND score gets lost. After that, it's the next player's turn
* The player can choose to 'Hold', which means that his/her ROUND score gets added to the GLOBAL score. After that, it's the next player's turn
* The first player to reach the user-set winning score wins the game

#### CODING CHALLENGES

Change the game to follow these rules:

1. A player loses his ENTIRE score when he rolls two 6 in a row. After that, it's the next player's turn. (Hint: Always save the previous dice roll in a separate variable)
2. Add an input field to the HTML where players can set the winning score, so that they can change the predefined score of 100. (Hint: you can read that value with the .value property in JavaScript. This is a good oportunity to use google to figure this out :)
3. Add another dice to the game, so that there are two dices now. The player loses his current score when one of them is a 1. (Hint: you will need CSS to position the second dice, so take a look at the CSS code for the first one.)

<a href="https://andrewrgoss.com/udemy-complete-javascript/dom-pig-game" class="btn" target="_blank">View my project</a>

<a href="https://github.com/andrewrgoss/udemy-complete-javascript/tree/gh-pages/dom-pig-game" class="btn" target="_blank">View my code on GitHub</a>