SRC			=	$(wildcard *.vhdl)
OBJ			=	$(SRC:.vhdl=.o)

TESTS		=	$(wildcard *_testbench.vhdl)
WAVES		=	$(TESTS:.vhdl=.ghw)
PROGS		=	$(WAVES:.ghw=)

all			:	$(OBJ) $(WAVES)

clean		:
				rm -f $(OBJ)
				rm -f $(PROGS)
				rm -f *.cf *.o

fclean		:	clean
				rm -f $(WAVES)

re			:	fclean all

.PHONY		:	all clean fclean re

%.o			:	%.vhdl
				ghdl -a $<

%.ghw		:	%.o
				ghdl -e $(@:.ghw=)
				ghdl -r $(@:.ghw=) --wave=$@
