##
## Makefile for asm in /home/sinet_l/Documents/project/asm
## 
## Made by luc sinet
## Login   <sinet_l@epitech.net>
## 
## Started on  Sat Mar  1 21:11:41 2014 luc sinet
## Last update Sun Mar  2 13:08:23 2014 luc sinet
##

NAME 	= libasm.so

COMP	= nasm -g -f elf64 -F dwarf

CC      = gcc

SRCDIR 	= src/

SRC	= strlen.S \
	  strcmp.S \
	  strncmp.S \
	  strcasecmp.S \
	  strstr.S \
	  strchr.S \
	  strpbrk.S \
	  strcspn.S \
	  rindex.S \
	  memset.S \
	  memcpy.S \
	  memmove.S

RM      = rm -f

OBJDIR	= obj/

OBJ    = $(addprefix $(OBJDIR), $(SRC:.S=.o))

CFLAGS	+=
LDFLAGS	+= -shared -fPIC -lpthread

dummy := $(shell test -d $(OBJDIR) || mkdir $(OBJDIR))

$(OBJDIR)%.o: $(SRCDIR)%.S
	$(COMP) $< -o $@

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(LDFLAGS) $(OBJ)

all: $(NAME)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
