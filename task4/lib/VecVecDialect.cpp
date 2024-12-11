#include "VecVecDialect.h"
#include "VecVecOps.h"

using namespace mlir;
using namespace mlir::vecvec;
using namespace mlir::vec;

VecVecDialect::VecVecDialect(MLIRContext *context)
    : Dialect(getDialectNamespace(), context, TypeID::get<VecVecDialect>()) {}

void VecVecDialect::initialize() {
 
  addOperations<
    MyOp
  >();
}

