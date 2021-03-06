SRCDIR = src
OBJDIR = build

CC = gcc
CFLAGS = -g -Wall -pedantic

TARGET = $(OBJDIR)/forage
OBJS = $(OBJDIR)/main.o $(OBJDIR)/window.o $(OBJDIR)/parser.o $(OBJDIR)/update.o

GTKDEPS = `pkg-config --cflags --libs gtk+-3.0`
GLIBDEPS = `pkg-config --cflags --libs glib-2.0`
LIBXMLDEPS = `xml2-config --cflags --libs`


all: $(OBJS) | $(OBJDIR)
	$(CC) -o $(TARGET) $(OBJS) $(CFLAGS) $(GTKDEPS) $(LIBXMLDEPS)

$(OBJDIR)/main.o: $(SRCDIR)/main.c | $(OBJDIR)
	$(CC) -c $(CFLAGS) $(SRCDIR)/main.c $(GTKDEPS) $(LIBXMLDEPS) -o $(OBJDIR)/main.o

$(OBJDIR)/window.o: $(SRCDIR)/window.c | $(OBJDIR)
	$(CC) -c $(CFLAGS) $(SRCDIR)/window.c $(GTKDEPS) -o $(OBJDIR)/window.o

$(OBJDIR)/parser.o: $(SRCDIR)/parser.c | $(OBJDIR)
	$(CC) -c $(CFLAGS) $(SRCDIR)/parser.c $(LIBXMLDEPS) $(GLIBDEPS) -o $(OBJDIR)/parser.o

$(OBJDIR)/update.o: $(SRCDIR)/update.c | $(OBJDIR)
	$(CC) -c $(CFLAGS) $(SRCDIR)/update.c $(LIBXMLDEPS) $(GLIBDEPS) -o $(OBJDIR)/update.o

$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -f $(OBJDIR)/*.o $(OBJDIR)/forage
