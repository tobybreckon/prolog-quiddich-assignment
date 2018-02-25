% School of Engineering and Computing Sciences, Durham University
% Level 2 – Programming Paradigms (Prolog Assignment 2015)
%
%% Base configuration - Toby Breckon, 2015
%% Version 0.3
%% - bug fix: (19/2/15, 0.2) all file loading for parts A-B should be lowercase, e.g. [partA] not [PartA]
%% - bug fix: (24/2/15, 0.2) all file loading for parts A-B should be of the form ":- [PartA]." to work everywhere.

%% do not change this file

:- dynamic pitch/4.
:- dynamic team/2.

%%%%%% define dimension of pitch and positions of goals

% the pitch is defined at ground level (Z = 0) here as a simple 2D rectangle
% of the perscribed size for quidditch ("500 feet (150 m) long and 180 feet (55 m) wide pitch")
% between the bottom left (X1,Y1) and top right (X2,Y2) corners
%% pitch(X1,Y1,X2,Y2).

pitch(0,0,55,150).

% six goals are defined, three at each end of the pitch by centre position
% (CX, CY, CZ) in 3D space and radius R on the Y-Z plane. Each goal "belongs"
% or is assigned to a given team, T, as being at their end of the pitch such that
% they must defend it.
% "stand three hooped goal posts, each at a different height: one at 30 ft (9.1 m),
% one at 40 ft (12 m), and one at 50 ft (15 m), comprising the scoring area"
%% goal(CX,CY,CZ,R, T).

goal(27,0,15,1, gryffindor).
goal(29,0,12,1, gryffindor).
goal(25,0,9,1, gryffindor).

goal(27,150,15,1, ravenclaw).
goal(29,150,12,1, ravenclaw).
goal(25,150,9,1, ravenclaw).

%%%%%% define the balls

% each game has a number of balls

ball(snitch).
ball(bludger). % 2 exist but one type of ball
ball(quaffle).

%%%%%% define the teams

% "Each team is made up of seven players, consisting of three Chasers, two Beaters, one Keeper and one Seeker."

% a minimum of two teams must be defined, of which two teams can play
% against each other at any given time

team(gryffindor, [oliver, angelina, katie, alicia, fred, george, harry]).
team(ravenclaw, [roger, randolph, jeremy, jason, duncan, cho, grant]).

% each player in a team has a single defined role / position

chaser(katie).
chaser(angelina).
chaser(alicia).
chaser(roger).
chaser(randolph).
chaser(jeremy).

beater(fred).
beater(george).
beater(jason).
beater(duncan).

keeper(oliver).
keeper(grant).

seeker(cho).
seeker(harry).

%%%%%% define the positions of entities on or off the pitch

% any position is valid (but it must be above ground level)

location(X,Y,Z):- integer(X), integer(Y), integer(Z), Z > 0.

% a player from a team can be at a given location

valid_position(P, X,Y,Z):- player(P, _), location(X,Y,Z).

% a ball can be at a given position

valid_position(B, X,Y,Z):- ball(B), location(X,Y,Z).

%%%%%% player and ball positions can be defined as (examples provided)
% you will need to define your own knowledge base examples to test your code

% player(P, X,Y,Z).
% ball(P, X,Y,Z).

% e.g.

% player(harry, 4,5,21).player_pos
% ball(snitch, 8,7,23).

%%%%%% current score can be defined as follows (examples provided)
% you will need to define your own knowledge base examples to test your code

% score(Team, Score).

% e.g.

% score(gryffindor,60).
% score(ravenclaw,10).

% Load Part A predicates

%:- [partA].

% Load Part B predicates

%:- [partB].

% Load Part C predicates

%:- [partC].

% load current state of the game

%:- [game].

