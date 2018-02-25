% School of Engineering and Computing Sciences, Durham University
% Level 2 – Programming Paradigms (Prolog Assignment 2015)
%
% testing file - T. Breckon

:- dynamic ball/4.
:- dynamic player/4.

%% some positions and tests based on pvxf29

% A.1 player()

test_player:-
                    player(oliver, gryffindor),
                    player(angelina, gryffindor),
                    player(katie, gryffindor),
                    player(fred, gryffindor),
                    player(george, gryffindor),
                    player(alicia, gryffindor),
                    player(harry, gryffindor),

                    not((player(oliver, ravenclaw),
                    player(angelina, ravenclaw),
                    player(katie, ravenclaw),
                    player(fred, ravenclaw),
                    player(george, ravenclaw),
                    player(alicia, ravenclaw),
                    player(harry, ravenclaw))),

                    player(roger, ravenclaw),
                    player(randolph, ravenclaw),
                    player(jeremy, ravenclaw),
                    player(duncan, ravenclaw),
                    player(cho, ravenclaw),
                    player(grant, ravenclaw),
                    player(jason, ravenclaw),

                    not((player(roger, gryffindor),
                    player(randolph, gryffindor),
                    player(jeremy, gryffindor),
                    player(duncan, gryffindor),
                    player(cho, gryffindor),
                    player(grant, gryffindor),
                    player(jason, gryffindor))),!,
                    !, nl, write('A.1 Test : Passed'), nl.

test_player:-  nl, write('A.1 Test : Failed'), nl.

% A.2 on_pitch()

% pitch(0,0,55,150).

test_on_pitch:-
                    on_pitch(1,2,3),
                    on_pitch(10,10,200),
                    on_pitch(0,55,1),
                    on_pitch(55,0,10),
                    on_pitch(55,150,10),

                    not((

                    on_pitch(1,2,-3),
                    on_pitch(10,-10,200),
                    on_pitch(0,156,1),
                    on_pitch(-1,0,10),
                    on_pitch(55,-15,10)

                    )),

                    retractall(pitch(_, _, _, _)),

                    assert(pitch(0,0,10,5)),

                    on_pitch(1,2,3),
                    on_pitch(10,4,200),
                    on_pitch(0,5,1),
                    on_pitch(10,0,10),
                    on_pitch(10,4,10),

                    not((

                    on_pitch(1,2,-3),
                    on_pitch(10,-4,200),
                    on_pitch(0,5,1),
                    on_pitch(-10,0,10),
                    on_pitch(10,-4,10)

                    )),

                    retractall(pitch(_, _, _, _)),

                    assert(pitch(0,0,55,150)),

                    !, nl, write('A.2 Test : Passed'), nl.

test_on_pitch:-  retractall(pitch(_, _, _, _)), assert(pitch(0,0,55,150)), nl, write('A.2 Test : Failed'),nl.

% A.3 off_pitch()

test_off_pitch:-

                    not((
                    off_pitch(1,2,3),
                    off_pitch(10,10,200),
                    off_pitch(0,55,1),
                    off_pitch(55,0,10),
                    off_pitch(55,150,10)

                    )),

                    off_pitch(1,56,-3),
                    off_pitch(10,-10,200),
                    off_pitch(0,156,1),
                    off_pitch(-1,0,10),
                    off_pitch(55,-15,10),

                    retractall(pitch(_, _, _, _)),

                    assert(pitch(0,0,10,5)),

                    not((

                    off_pitch(1,2,3),
                    off_pitch(10,4,200),
                    off_pitch(0,5,1),
                    off_pitch(10,0,10),
                    off_pitch(10,4,10)

                    )),

                    off_pitch(1,2,-3),
                    off_pitch(10,-4,200),
                    off_pitch(0,6,1),
                    off_pitch(-10,0,10),
                    off_pitch(11,-4,10),

                     retractall(pitch(_, _, _, _)),

                     assert(pitch(0,0,55,150)),

                    !, nl, write('A.3 Test : Passed'), nl.

test_off_pitch:-  retractall(pitch(_, _, _, _)), assert(pitch(0,0,55,150)), nl, write('A.3 Test : Failed'),nl.

% A.4 valid_team()

test_valid_team:- valid_team(gryffindor),
                    team(gryffindor, TList),
                    length(TList, 7),
                    findall(P, (player(P,gryffindor), chaser(P)), Chasers),
                    length(Chasers, 3),
                    findall(P, (player(P,gryffindor), beater(P)), Beaters),
                    length(Beaters, 2),
                    findall(P, (player(P,gryffindor), seeker(P)), Seekers),
                    length(Seekers, 1),
                    findall(P, (player(P,gryffindor), keeper(P)), Keeper),
                    length(Keeper, 1),

                    valid_team(ravenclaw),
                    team(ravenclaw, TList2),
                    length(TList2, 7),
                    findall(P, (player(P,ravenclaw), chaser(P)), Chasers2),
                    length(Chasers2, 3),
                    findall(P, (player(P,ravenclaw), beater(P)), Beaters2),
                    length(Beaters2, 2),
                    findall(P, (player(P,ravenclaw), seeker(P)), Seekers2),
                    length(Seekers2, 1),
                    findall(P, (player(P,ravenclaw), keeper(P)), Keeper2),
                    length(Keeper2, 1),

                    retractall(team(_, _)),

                    assert(team(wrong1, [oliver, angelina, katie, alicia, fred, george])),
                    assert(team(wrong2, [roger, randolph, jeremy, jason, harry, cho, grant])),
                    assert(team(wrong3, [oliver, angelina, katie, alicia, fred, george, harry])),
                    assert(team(wrong4, [oliver, angelina, jeremy, jason, duncan, cho, grant])),
                    assert(team(wrong5, [oliver, angelina, katie, oliver, angelina, katie, harry])),
                    assert(team(wrong6, [roger, randolph, jeremy, jason, duncan, harry, grant])),
                    assert(team(wrong7, [oliver, katie, katie, alicia, fred, george, harry])),
                    assert(team(wrong8, [oliver, angelina, katie, alicia, fred, george, grant])),

                    not((
                        valid_team(wrong1),
                        valid_team(wrong2),
                        valid_team(wrong3),
                        valid_team(wrong4),
                        valid_team(wrong5),
                        valid_team(wrong6),
                        valid_team(wrong7),
                        valid_team(wrong8)
                    )),

                    retractall(team(_, _)),

                    assert(team(gryffindor, [oliver, angelina, katie, alicia, fred, george, harry])),
                    assert(team(ravenclaw, [roger, randolph, jeremy, jason, duncan, cho, grant])),

                    nl, write('A.4 Test : Passed'), nl.

test_valid_team:-   retractall(team(_, _)),
                    assert(team(gryffindor, [oliver, angelina, katie, alicia, fred, george, harry])),
                    assert(team(ravenclaw, [roger, randolph, jeremy, jason, duncan, cho, grant])),
                    nl, write('A.4 Test : Failed'),nl.


% B.1 snitch_caught()

test_snitch_caught:-

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),
    assert(ball(snitch, 20,20,20)),     % snitch caught
    assert(player(harry, 20,20,20)),    % snitch caught
    assert(player(cho, 40,42,44)),      % does not have snitch

    % test

    snitch_caught(gryffindor),
    not(snitch_caught(ravenclaw)),

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    nl, write('B.1 Test : Passed'), nl.


test_snitch_caught:-

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    nl, write('B.1 Test : Failed'), nl.

% B.2 goal_scored()

test_goal_scored:-

    % players - gry.

    assert(player(oliver, 10,10,10)),
    assert(player(katie, 25,25,25)),
    assert(player(angelina, 27,150,10)),
    assert(player(alicia, 10,20,31)),
    assert(player(fred, 50,50,50)),
    assert(player(george, 35,35,35)),
    assert(player(harry, 20,20,30)),

    % players - Ravenclaw

    assert(player(roger, 25,35,45)),
    assert(player(randolph, 15,25,35)),
    assert(player(jeremy, 5,15,25)),
    assert(player(jason, 10,20,30)),
    assert(player(duncan, 40,30,50)),
    assert(player(grant, 20,10,5)),
    assert(player(cho, 40,42,44)),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 27,150,15)),
    goal_scored(gryffindor),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 29,150,12)),
    goal_scored(gryffindor),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 25,150,9)),
    goal_scored(gryffindor),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 27,0,15)),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 29,0,12)),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 25,0,9)),
    goal_scored(ravenclaw),

    not((

    %% opposite end tests

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 27,150,15)),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 29,150,12)),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 25,150,9)),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 27,0,15)),
    goal_scored(gryffindor),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 29,0,12)),
    goal_scored(gryffindor),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 25,0,9)),
    goal_scored(gryffindor),

    %% not goal tests

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 29,150,9)),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 27,150,9)),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 4,0,15)),
    goal_scored(gryffindor),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 18,0,12)),
    goal_scored(gryffindor),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 25,1,9)),
    goal_scored(gryffindor),

    %% boundary tests - which are not goals

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 27,150,14)),
    goal_scored(gryffindor),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 28,150,12)),
    goal_scored(gryffindor),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 24,150,9)),
    goal_scored(gryffindor),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 27,1,15)),
    goal_scored(gryffindor),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 29,0,13)),
    goal_scored(gryffindor),
    goal_scored(ravenclaw),

    retractall(ball(_, _,_,_)),
    assert(ball(quaffle, 25,0,10)),
    goal_scored(gryffindor),
    goal_scored(ravenclaw)

    )),

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    nl, write('B.2 Test : Passed'), nl.


test_goal_scored:-

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    nl, write('B.2 Test : Failed'), nl.

% B.3 foul()

test_foul:-

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    % players - gry.

    assert(player(oliver, 10,10,10)),
    assert(player(katie, 25,25,25)),
    assert(player(angelina, 27,150,10)),
    assert(player(alicia, 10,20,31)),
    assert(player(fred, 50,50,50)),
    assert(player(george, 35,35,35)),
    assert(player(harry, 20,20,30)),

    % players - Ravenclaw

    assert(player(roger, 25,35,45)),
    assert(player(randolph, 15,25,35)),
    assert(player(jeremy, 5,15,25)),
    assert(player(jason, 10,20,30)),
    assert(player(duncan, 40,30,50)),
    assert(player(grant, 20,10,5)),
    assert(player(cho, 40,42,44)),

    assert(ball(quaffle, 27,150,15)),

    not((
        foul(gryffindor),
        foul(ravenclaw)
        )),

    % players - fouls

    retractall(player(angelina, _,_,_)),
    assert(player(angelina, 27,150,15)), % player holding quaffle while scoring -> Foul

    foul(gryffindor),
    not(foul(ravenclaw)),

    retractall(player(angelina, _,_,_)),
    assert(player(angelina, 27,150,10)),

    assert(ball(snitch, 20,20,20)),
    retractall(player(george, _,_,_)),
    assert(player(george, 20,20,20)), % B3 - Non seeker has caught snitch -> Foul

    foul(gryffindor),
    not(foul(ravenclaw)),

    retractall(player(george, _,_,_)),
    assert(player(george, 35,35,35)),

    retractall(player(randolph, _,_,_)),
    assert(player(randolph, -15,25,35)), % B3 - Replace for Player in invalid position -> Foul

    foul(ravenclaw),
    not(foul(gryffindor)),

    retractall(player(randolph, _,_,_)),
    assert(player(randolph, 15,25,35)),

    retractall(player(fred, _,_,_)),

    assert(player(fred, 40,30,50)), % B3 - player(alicia, 10,20,31).Player collision with Fred and duncan-> Foul

    foul(ravenclaw),
    foul(gryffindor),

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    nl, write('B.3 Test : Passed'), nl.


test_foul:-

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    nl, write('B.3 Test : Failed'), nl.

% C.1 hits()

test_hits:-

    retractall(player(_, _,_,_)),

    assert(player(alicia, 10,20,31)),
    assert(player(jason, 10,20,30)),

    hits(jason, alicia),

    not(hits(alicia, jason)),

    retractall(player(_, _,_,_)),

    assert(player(duncan, 1,2,3)),
    assert(player(oliver, 1,3,3)),

    hits(duncan, oliver),

    not(hits(oliver, duncan)),

    assert(player(george, 2,2,3)),
    assert(player(roger, 1,2,3)),

    hits(george, roger),

    not(hits(roger, george)),

    not((

    hits(george, alicia),
    hits(george, oliver),
    hits(jason, roger)

    )),

    retractall(player(_, _,_,_)),

    nl, write('C.1 Test : Passed'), nl.

test_hits:-

    retractall(player(_, _,_,_)),

    nl, write('C.1 Test : Failed'), nl.%% ball(bludger, 40,30,50).

% C.2 end_of_game()

test_end_of_game:-

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),

    % test snitch caught

    assert(ball(bludger, 40,30,50)),
    assert(ball(bludger, 50,50,50)),
    assert(ball(quaffle, 27,150,15)), % Goal scored -> update score +10
    assert(ball(snitch, 20,20,20)),

    %% % Griffindor players
    assert(player(oliver, 10,10,10)),
    assert(player(katie, 25,25,25)),
    assert(player(angelina, 27,150,10)),
    assert(player(alicia, 10,20,31)),
    assert(player(fred, 50,50,50)),
    assert(player(george, 35,35,35)),
    assert(player(harry, 20,20,20)), % Snitch caught - game ended and update score +150

    %% % Ravenclaw
    assert(player(roger, 25,35,45)),
    assert(player(randolph, 15,25,35)),
    assert(player(jeremy, 5,15,25)),
    assert(player(jason, 10,20,29)),
    assert(player(duncan, 40,30,50)),
    assert(player(grant, 20,10,5)),
    assert(player(cho, 40,42,44)),

    end_of_game(gryffindor, ravenclaw),

    retractall(ball(_,_,_,_)),
    retractall(player(_,_,_,_)),

    % test foul stops end

    assert(ball(bludger, 40,30,50)),
    assert(ball(bludger, 50,50,50)),
    assert(ball(quaffle, 27,150,15)), % Goal scored -> update score +10
    assert(ball(snitch, 20,20,20)),

    %% % Griffindor players
    assert(player(oliver, 10,10,10)),
    assert(player(katie, 25,25,25)),
    assert(player(angelina, 27,150,10)),
    assert(player(alicia, 10,20,31)),
    assert(player(fred, 50,50,50)),
    assert(player(george, 35,35,35)),
    assert(player(harry, 20,20,20)), % Snitch caught - game ended and update score +150

    %% % Ravenclaw
    assert(player(roger, 25,35,45)),
    assert(player(randolph, 15,25,35)),
    assert(player(jeremy, 5,15,25)),
    assert(player(jason, 10,20,31)),  % C1 - Hits alicia, C2 - end game, foul stops game ending
    assert(player(duncan, 40,30,50)),
    assert(player(grant, 20,10,5)),
    assert(player(cho, 40,42,44)),

    not( end_of_game(gryffindor, ravenclaw) ),

    retractall(team(_,_)),

    % test invalid team

    assert(team(gryffindor, [oliver, angelina, katie, alicia, fred, george, harry])),
    assert(team(ravenclaw, [roger, randolph, jeremy, jason, duncan, cho])),
    retractall(player(jason, _,_,_)),
    assert(player(jason, 10,20,29)),

    not( end_of_game(gryffindor, ravenclaw) ),

    retractall(ball(_,_,_,_)),
    retractall(player(_, _,_,_)),

    retractall(team(_,_)),
    assert(team(gryffindor, [oliver, angelina, katie, alicia, fred, george, harry])),
    assert(team(ravenclaw, [roger, randolph, jeremy, jason, duncan, cho, grant])),

    nl, write('C.2 Test : Passed'), nl.

test_end_of_game:-

    retractall(ball(_,_,_,_)),
    retractall(player(_,_,_,_)),
    retractall(team(_,_)),
    assert(team(gryffindor, [oliver, angelina, katie, alicia, fred, george, harry])),
    assert(team(ravenclaw, [roger, randolph, jeremy, jason, duncan, cho, grant])),

    nl, write('C.2 Test : Failed'), nl.

% C.3 update_score()

test_update_score:-

    retractall(ball(_, _,_,_)),
    retractall(player(_,_,_,_)),
    retractall(team(_,_)),

    assert(team(gryffindor, [oliver, angelina, katie, alicia, fred, george, harry])),
    assert(team(ravenclaw, [roger, randolph, jeremy, jason, duncan, cho, grant])),

    % test goal

    assert(ball(bludger, 40,30,50)),
    assert(ball(bludger, 50,50,50)),
    assert(ball(quaffle, 27,150,15)), % Goal scored -> update score +10
    assert(ball(snitch, 20,20,20)),

    %% % Griffindor players
    assert(player(oliver, 10,10,10)),
    assert(player(katie, 25,25,25)),
    assert(player(angelina, 27,150,10)),
    assert(player(alicia, 10,20,31)),
    assert(player(fred, 50,50,50)),
    assert(player(george, 35,35,35)),
    assert(player(harry, 20,20,30)), % snitch not caught

    %% % Ravenclaw
    assert(player(roger, 25,35,45)),
    assert(player(randolph, 15,25,35)),
    assert(player(jeremy, 5,15,25)),
    assert(player(jason, 10,20,29)),
    assert(player(duncan, 40,30,50)),
    assert(player(grant, 20,10,5)),
    assert(player(cho, 40,42,44)),

    retractall(score(_, _)),
    assert(score(gryffindor, 20)),
    assert(score(ravenclaw, 40)),

    valid_team(gryffindor),  nl, write('--- C.3 Test : valid team'), nl,
    goal_scored(gryffindor),  write('--- C.3 Test : goal scored - test 1'), nl,

    update_score(gryffindor, SG, ravenclaw, SR),

    SG is 30,                          % check score is now 20 + 10
    SR is 40,

    write('--- C.3 Test : test 1 passed'), nl,

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),
    retractall(score(_, _)),

    % test not a goal

    assert(ball(bludger, 40,30,50)),
    assert(ball(bludger, 50,50,50)),
    assert(ball(quaffle, 27,150,12)), % No Goal scored -> do not update score +10
    assert(ball(snitch, 20,20,20)),

    %% % Griffindor players
    assert(player(oliver, 10,10,10)),
    assert(player(katie, 25,25,25)),
    assert(player(angelina, 27,150,10)),
    assert(player(alicia, 10,20,31)),
    assert(player(fred, 50,50,50)),
    assert(player(george, 35,35,35)),
    assert(player(harry, 20,20,30)), % snitch not caught

    %% % Ravenclaw
    assert(player(roger, 25,35,45)),
    assert(player(randolph, 15,25,35)),
    assert(player(jeremy, 5,15,25)),
    assert(player(jason, 10,20,29)),
    assert(player(duncan, 40,30,50)),
    assert(player(grant, 20,10,5)),
    assert(player(cho, 40,42,44)),

    retractall(score(_, _)),
    assert(score(gryffindor, 20)),
    assert(score(ravenclaw, 40)),

    valid_team(gryffindor),  nl, write('--- C.3 Test : valid team'), nl,
    not(goal_scored(gryffindor)),  write('--- C.3 Test : goal not scored - test 2'), nl,

    update_score(gryffindor, SG1, ravenclaw, SR1),

    SG1 is 20,                          % check score is still 20
    SR1 is 40,

    write('--- C.3 Test : test 2 passed'), nl,

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),
    retractall(score(_, _)),

    % test snitch caught

    assert(ball(bludger, 40,30,50)),
    assert(ball(bludger, 50,50,50)),
    assert(ball(quaffle, 27,150,12)), % No Goal scored -> do not update score +10
    assert(ball(snitch, 20,20,20)),

    %% % Griffindor players
    assert(player(oliver, 10,10,10)),
    assert(player(katie, 25,25,25)),
    assert(player(angelina, 27,150,10)),
    assert(player(alicia, 10,20,31)),
    assert(player(fred, 50,50,50)),
    assert(player(george, 35,35,35)),
    assert(player(harry, 20,20,20)), % snitch caught

    %% % Ravenclaw
    assert(player(roger, 25,35,45)),
    assert(player(randolph, 15,25,35)),
    assert(player(jeremy, 5,15,25)),
    assert(player(jason, 10,20,29)),
    assert(player(duncan, 40,30,50)),
    assert(player(grant, 20,10,5)),
    assert(player(cho, 40,42,44)),

    retractall(score(_, _)),
    assert(score(gryffindor, 20)),
    assert(score(ravenclaw, 40)),

    valid_team(gryffindor),  nl, write('--- C.3 Test : valid team'), nl,
    snitch_caught(gryffindor),  write('--- C.3 Test : snitch caught - test 3'), nl,

    update_score(gryffindor, SG2, ravenclaw, SR2),

    SG2 is 170,    % check score is now 20 + 150
    SR2 is 40,

    write('--- C.3 Test : test 3 passed'), nl,

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),
    retractall(score(_, _)),

    nl, write('C.3 Test : Passed'), nl.

test_update_score:-

    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),
    retractall(score(_, _)),

    nl, write('C.3 Test : Failed'), nl.

% overall load and test

test:-  nl,  working_directory(CWD, CWD), write('Working in: '), write(CWD), nl,
    nl,  write('** Part A Tests : '), nl, test_player, nl, !, test_on_pitch, nl, !, test_off_pitch, nl, !, test_valid_team, nl, !,
    nl,  write('** Part B Tests : '), nl, test_snitch_caught, nl, !, test_goal_scored, nl, !, test_foul, !, nl,
    nl,  write('** Part C Tests : '), nl, test_hits, !, nl, test_end_of_game, !, nl, test_update_score, !, nl,
    nl.

reset:-
    retractall(ball(_, _,_,_)),
    retractall(player(_, _,_,_)),
    retractall(team(_, _)),
    [base], [partA], [partB], [partC].

:-  nl,  write('resetting and loading ...'), reset, nl, write('testing...'), test, nl.
