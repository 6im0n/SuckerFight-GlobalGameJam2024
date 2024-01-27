/*
** EPITECH PROJECT, 2024
** GlobalGameJam-2024
** File description:
** player
*/

#pragma once

#include "../include.hpp"
#include "./enum/enum.hpp"

class Player {
    public:
        Player(PlayerType type = PlayerType::PLAYER1);
        ~Player();
        void handleEvent(sf::Event event);
        void update();
        void draw(sf::RenderWindow &window);
        void move(sf::Vector2f move);
        void setPlayerPos(sf::Vector2f pos);
        sf::Vector2f getOldPlayerPos() const;
        bool isColliding(sf::RectangleShape colision);
        void displayColisionHitBox(sf::RenderWindow &window);
        void resetJump();
        void stateFly(bool state);
        void jump();



    private:
        void init(PlayerType type);
        void initSprite();
        void initTexture();
        void initPos();
        void initSpeed();
        void initColision();
        void initAttackColision(size_t reachSize);
        void updateColision();
        void updateAttackColision();
        void clean();

        sf::Sprite _player;
        sf::Texture _playerTexture;
        sf::Vector2f _playerPos;
        sf::Vector2f _oldPlayerPos;
        sf::Vector2f _velocity;
        sf::Vector2f _acceleration;
        sf::Vector2f _playerSpeed;
        sf::RectangleShape _playerColision;
        sf::RectangleShape _playerAttackColision;
        size_t reachSize;
        bool lookingRight;
        bool isAttacking;
        bool displayColision;
        float _gravity;
        bool _isFly;
        float _jumpForce;
        JumpType _isJumping;
        sf::Keyboard::Key _right;
        sf::Keyboard::Key _left;
        sf::Keyboard::Key _up;
        sf::Keyboard::Key _attack;
        sf::Keyboard::Key _jump;
        sf::Keyboard::Key _displayColision;

};