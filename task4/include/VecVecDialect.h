#ifndef VECEVEC_DIALECT_H
#define VECEVEC_DIALECT_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "VecVecOps.h"

namespace mlir {
namespace vecvec {

class VecVecDialect : public Dialect {
public:
  explicit VecVecDialect(MLIRContext *context);
  static StringRef getDialectNamespace() { return "vecs"; }
  void initialize();
};

} // namespace vecvec
} // namespace mlir

#endif // VECEVEC_DIALECT_H

