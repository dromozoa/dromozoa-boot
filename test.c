#include <stdio.h>
#include <string.h>

int main(int ac, char* av[]) {
  char command = av[1][0];
  char buffer[256] = { 0 };
  if (command == '0') {
    if (fgets(buffer, 256, stdin)) {
      printf("%s", buffer);
      return 0;
    }
  } else if (command == 'p') {
    while (fgets(buffer, 256, stdin)) {
      if (strncmp(buffer, "Included patches: ", 18) == 0) {
        printf("%s", buffer);
        return 0;
      }
    }
  }
  return 1;
}
