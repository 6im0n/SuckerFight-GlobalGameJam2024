##
## EPITECH PROJECT, 2024
## GameJam
## File description:
## Makefile for GameJam / sfml
##

## config
NAME = 			GGJ2024

_SRC =			app/App.cpp \
				player/Player.cpp \
				player/Attack.cpp\
				player/Init.cpp\
				map/Map.cpp \
				game/Game.cpp \
				utils/SpriteSheetSimplifier.cpp\
				player/Life.cpp\
				menu/Menu.cpp\
				Main.cpp

SRCDIR = 		src/

SRC =			$(addprefix $(SRCDIR), $(_SRC))

OBJ = 			$(SRC:.cpp=.o)

INC = 			-I./include

FLAGS 	=		-W -Wall -Wextra -Werror -g

MODULES = -l sfml-graphics -l sfml-window -l sfml-system -l sfml-audio

WIN_INCLUDE = 	-I./SFML-2.6.1/include -I./include

WIN_LIBS =		-L./SFML-2.6.1/lib

all: 			$(NAME) clean

##Colors
color_green = /bin/echo -e "\x1b[32m $1\x1b[0m"
color_yellow = /bin/echo -e "\x1b[33m $1\x1b[0m"

##Rules
win_build:
				x86_64-w64-mingw32-windres win-build.rc -O coff -o win-build.res
				x86_64-w64-mingw32-g++ -DSFML_STATIC -o ./build/win32/$(NAME) $(SRC) win-build.res $(WIN_INCLUDE) $(WIN_LIBS) $(MODULES)
				@$(MAKE) clean -s
$(NAME):
				@g++ -o ./build/linux/$(NAME) $(SRC) $(INC) $(LIBS) $(MODULES) $(FLAGS)
				@$(call color_green,"Compilation Done ✅ !")
				@$(MAKE) clean -s

clean:
				@rm -f $(OBJ)
fclean: 		clean
				@rm -f $(NAME)

re: 			fclean all


run: re
	clear
	@$(call color_yellow,"🚀:")
	@./$(NAME) $(ARGS)
