#
# Cross Platform Makefile
#

#CXX = g++
#CXX = clang++

EXE = game 
SOURCES = game.cpp engine.cpp pixels.cpp
#SOURCES += ../../libraries_cpp/ImGuiFileDialog/ImGuiFileDialog.cpp
OBJS = $(addsuffix .o, $(basename $(notdir $(SOURCES))))
UNAME_S := $(shell uname -s)

CXXFLAGS = -I./include/ -I.
CXXFLAGS += -g -std=c++17 -Wall -Wformat 
LIBS =

##---------------------------------------------------------------------
## BUILD FLAGS PER PLATFORM
##---------------------------------------------------------------------

ifeq ($(UNAME_S), Linux) #LINUX
	ECHO_MESSAGE = "Linux"
	LIBS += -lX11 -lGL -lpthread -lpng -lstdc++ -lstdc++fs 

	CFLAGS = $(CXXFLAGS)
endif

##---------------------------------------------------------------------
## BUILD RULES
##---------------------------------------------------------------------

%.o:%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#%.o:../%.cpp
#	$(CXX) $(CXXFLAGS) -c -o $@ $<

#%.o:../../%.cpp
#	$(CXX) $(CXXFLAGS) -c -o $@ $<

#%.o:../../libraries_cpp/dear_imgui/%.cpp
#	$(CXX) $(CXXFLAGS) -c -o $@ $<

all: $(EXE)
	@echo Build complete for $(ECHO_MESSAGE)

$(EXE): $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

clean:
	rm -f $(EXE) $(OBJS)

cleanobj: 
	rm -f $(OBJS)

objclean:
	rm -f $(OBJS)
