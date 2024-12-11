#ifndef VECEVEC_OPS_H
#define VECEVEC_OPS_H

#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/Operation.h"

namespace mlir {
namespace vec {

// تعریف عملیات MyOp
class MyOp : public Op<MyOp, OpTrait::ZeroOperands, OpTrait::ZeroResults> {
public:
  using Op::Op;

  // نام عملیات
  static StringRef getOperationName() { return "vec.myop"; }

  // متد ساخت
  static void build(OpBuilder &builder, OperationState &state) {
    // منطق ساخت عملیات در صورت نیاز اینجا تعریف شود.
  }

  // متد ضروری برای مشخص کردن Attributeهای عملیات
  static void getAttributeNames(SmallVectorImpl<StringRef> &names) {
    names.push_back("attributeName1"); // نام attribute ها
    names.push_back("attributeName2"); // نام دیگر attribute ها
  }

};

} // namespace vec
} // namespace mlir

#endif // VECEVEC_OPS_H

