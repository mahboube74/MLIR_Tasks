#ifndef VECEVEC_OPS_H
#define VECEVEC_OPS_H

#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/Operation.h"

namespace mlir {
namespace vec {

class MyOp : public Op<MyOp, OpTrait::ZeroOperands, OpTrait::ZeroResults> {
public:
  using Op::Op;

  static StringRef getOperationName() { return "vec.myop"; }

  static void build(OpBuilder &builder, OperationState &state) {
  }

  static void getAttributeNames(SmallVectorImpl<StringRef> &names) {
    names.push_back("attributeName1"); 
    names.push_back("attributeName2"); 
  }

};

} // namespace vec
} // namespace mlir

#endif // VECEVEC_OPS_H

