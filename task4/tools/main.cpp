#include "mlir/Pass/PassManager.h"
#include "LowerVecVecPass.h"  // Your custom pass header

int main(int argc, char **argv) {
    mlir::DialectRegistry registry;
    registry.insert<mlir::vecvec::VecVecDialect>();

    mlir::PassPipelineRegistration<> pipeline(
        "lower-vecvec", "Lower VecVec operations to LLVM IR",
        [](mlir::OpPassManager &pm) { pm.addPass(createLowerVecVecPass()); });

    return mlir::asMainReturnCode(mlir::MlirOptMain(argc, argv, "MLIR lower-vecvec tool", registry));
}
