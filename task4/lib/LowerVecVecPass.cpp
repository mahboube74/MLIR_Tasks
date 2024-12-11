#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Pass/Pass.h"
#include "llvm/Support/Casting.h"

using namespace mlir;

namespace {
struct LowerVecVecPass : public PassWrapper<LowerVecVecPass, OperationPass<func::FuncOp>> {
    void runOnOperation() override {
        auto func = llvm::dyn_cast<func::FuncOp>(getOperation());
        if (!func) return; // اطمینان از اینکه عملیات صحیح است
        
        OpBuilder builder(func.getContext());

        func.walk([&](Operation *op) {
            if (auto dotOp = dyn_cast<arith::MulFOp>(op)) {
                builder.setInsertionPoint(dotOp);
                auto newOp = builder.create<arith::MulFOp>(dotOp.getLoc(), dotOp.getLhs(), dotOp.getRhs());
                dotOp.replaceAllUsesWith(newOp.getResult()); // اصلاح شده
                dotOp.erase();
            }
        });
    }
};
} // end anonymous namespace

std::unique_ptr<Pass> createLowerVecVecPass() {
    return std::make_unique<LowerVecVecPass>();  // اصلاح شد
}

