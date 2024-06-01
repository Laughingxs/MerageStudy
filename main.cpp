#include "hello1.h"
#include "hello2.h"

int main() {
    hello1();
    hello2();
    std::cout << "Hello, world!" << std::endl;
    // 添加一些代码以触发覆盖率
    return 0;
}
