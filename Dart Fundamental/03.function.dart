// positional arguments
double sum(double x, int y) {
  return x + y;
}

// Named arguments -> they are optional
int sumOfTwoNumber({int x = 0, int y = 0}) {
  return x + y;
}

int answer(int a, int b) => sumOfTwoNumber(x: a, y: b);
void main() {
  print(sum(8.9, 90));
  print(sumOfTwoNumber(x: 90, y: 70));
  print(answer(89, 090));
}
