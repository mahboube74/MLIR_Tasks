#include "VecVecOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/OpImplementation.h"

using namespace mlir;
using namespace mlir::vec;

void MyOp::build(OpBuilder &builder, OperationState &state, Value lhs, Value rhs) {
  state.addOperands({lhs, rhs});
  state.addTypes(builder.getF32Type()); // نتیجه اسکالر است (float)
}

LogicalResult MyOp::verify() {
  if (getOperand(0).getType() != getOperand(1).getType()) {
    return emitOpError("Operands must have the same type.");
  }

  auto vectorType = getOperand(0).getType().dyn_cast<VectorType>();
  if (!vectorType || vectorType.getRank() != 1) {
    return emitOpError("Operands must be 1D vectors.");
  }
  
  return success();
}

