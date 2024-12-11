#include "VecVecDialect.h"
#include "VecVecOps.h"

using namespace mlir;
using namespace mlir::vecvec;
using namespace mlir::vec;

// سازنده دیالکت
VecVecDialect::VecVecDialect(MLIRContext *context)
    : Dialect(getDialectNamespace(), context, TypeID::get<VecVecDialect>()) {}

// مقداردهی اولیه دیالکت
void VecVecDialect::initialize() {
  // اضافه کردن عملیات MyOp به دیالکت
  addOperations<
    MyOp
  >();
}

