vpath %.cpp ./src/
vpath %.o ./bin/
vpath %.h ./include/

SOURCES =	TextureObject.cpp \
			RenderTextureObject.cpp \
			Drawable.cpp \
			DrawableList.cpp \
			DrawText.cpp \
			LabeledDrawable.cpp \
			Container.cpp \
			Button.cpp \
			ListItem.cpp \
			Main.cpp
			
OBJECTS = 	TextureObject.o \
			RenderTextureObject.o \
			Drawable.o \
			DrawableList.o \
			DrawText.o \
			LabeledDrawable.o \
			Container.o \
			Button.o \
			ListItem.o \
			Main.o
			
HEADERS =	$(wildcard *.h)

CC = g++
CFLAGS = -g \
	-Wall \
	-Wextra \
	-pedantic \
# endlist

CPPFLAGS := $(CFLAGS) -I include

LDFLAGS :=  -lm -lmagic -lGL -lGLU -lglut -lSDL -lSDL_ttf -lSDL_image -lX11

.PHONY: default
default: normbuild

.PHONY: clean
clean:
	cd bin
	rm -f $(OBJECTS) starnavi
	cd ..

normbuild:$(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o testapp

testbuild:$(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o testapp	
	mv -f ./testapp ~/
	chmod +x ~/testapp

