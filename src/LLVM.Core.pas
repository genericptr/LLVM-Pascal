{
    Generated from LLVM 16 using H2Pas

    ====================================================================

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
}

{$mode objfpc}

unit LLVM.Core;
interface
uses
  UnixType, LLVM.Types;

// TODO: Missing `LLVM_FOR_EACH_VALUE_SUBCLASS`(macro) macros for `LLVMIsA*` functions

{$include LLVM.Macros.inc}

const
  LLVMAttributeReturnIndex = 0;
  LLVMAttributeFunctionIndex = -1;

type
  LLVMOpcode = (LLVMRet := 1,LLVMBr := 2,LLVMSwitch := 3,
    LLVMIndirectBr := 4,LLVMInvoke := 5,
    LLVMUnreachable := 7,LLVMCallBr := 67,
    LLVMFNeg := 66,LLVMAdd := 8,LLVMFAdd := 9,
    LLVMSub := 10,LLVMFSub := 11,LLVMMul := 12,
    LLVMFMul := 13,LLVMUDiv := 14,LLVMSDiv := 15,
    LLVMFDiv := 16,LLVMURem := 17,LLVMSRem := 18,
    LLVMFRem := 19,LLVMShl := 20,LLVMLShr := 21,
    LLVMAShr := 22,LLVMAnd := 23,LLVMOr := 24,
    LLVMXor := 25,LLVMAlloca := 26,LLVMLoad := 27,
    LLVMStore := 28,LLVMGetElementPtr := 29,
    LLVMTrunc := 30,LLVMZExt := 31,LLVMSExt := 32,
    LLVMFPToUI := 33,LLVMFPToSI := 34,LLVMUIToFP := 35,
    LLVMSIToFP := 36,LLVMFPTrunc := 37,LLVMFPExt := 38,
    LLVMPtrToInt := 39,LLVMIntToPtr := 40,
    LLVMBitCast := 41,LLVMAddrSpaceCast := 60,
    LLVMICmp := 42,LLVMFCmp := 43,LLVMPHI := 44,
    LLVMCall := 45,LLVMSelect := 46,LLVMUserOp1 := 47,
    LLVMUserOp2 := 48,LLVMVAArg := 49,LLVMExtractElement := 50,
    LLVMInsertElement := 51,LLVMShuffleVector := 52,
    LLVMExtractValue := 53,LLVMInsertValue := 54,
    LLVMFreeze := 68,LLVMFence := 55,LLVMAtomicCmpXchg := 56,
    LLVMAtomicRMW := 57,LLVMResume := 58,
    LLVMLandingPad := 59,LLVMCleanupRet := 61,
    LLVMCatchRet := 62,LLVMCatchPad := 63,
    LLVMCleanupPad := 64,LLVMCatchSwitch := 65
    );

  LLVMTypeKind = (LLVMVoidTypeKind,LLVMHalfTypeKind,LLVMFloatTypeKind,
    LLVMDoubleTypeKind,LLVMX86_FP80TypeKind,
    LLVMFP128TypeKind,LLVMPPC_FP128TypeKind,
    LLVMLabelTypeKind,LLVMIntegerTypeKind,
    LLVMFunctionTypeKind,LLVMStructTypeKind,
    LLVMArrayTypeKind,LLVMPointerTypeKind,
    LLVMVectorTypeKind,LLVMMetadataTypeKind,
    LLVMX86_MMXTypeKind,LLVMTokenTypeKind,
    LLVMScalableVectorTypeKind,LLVMBFloatTypeKind,
    LLVMX86_AMXTypeKind,LLVMTargetExtTypeKind
  );

  LLVMLinkage = (LLVMExternalLinkage,LLVMAvailableExternallyLinkage,
    LLVMLinkOnceAnyLinkage,LLVMLinkOnceODRLinkage,
    LLVMLinkOnceODRAutoHideLinkage,LLVMWeakAnyLinkage,
    LLVMWeakODRLinkage,LLVMAppendingLinkage,
    LLVMInternalLinkage,LLVMPrivateLinkage,
    LLVMDLLImportLinkage,LLVMDLLExportLinkage,
    LLVMExternalWeakLinkage,LLVMGhostLinkage,
    LLVMCommonLinkage,LLVMLinkerPrivateLinkage,
    LLVMLinkerPrivateWeakLinkage);

  LLVMVisibility = (LLVMDefaultVisibility,LLVMHiddenVisibility,
      LLVMProtectedVisibility);

  LLVMUnnamedAddr = (LLVMNoUnnamedAddr,LLVMLocalUnnamedAddr,
      LLVMGlobalUnnamedAddr);

  LLVMDLLStorageClass = (LLVMDefaultStorageClass := 0,
    LLVMDLLImportStorageClass := 1,
      LLVMDLLExportStorageClass := 2);

  LLVMCallConv = (LLVMCCallConv := 0,LLVMFastCallConv := 8,
    LLVMColdCallConv := 9,LLVMGHCCallConv := 10,
    LLVMHiPECallConv := 11,LLVMWebKitJSCallConv := 12,
    LLVMAnyRegCallConv := 13,LLVMPreserveMostCallConv := 14,
    LLVMPreserveAllCallConv := 15,LLVMSwiftCallConv := 16,
    LLVMCXXFASTTLSCallConv := 17,LLVMX86StdcallCallConv := 64,
    LLVMX86FastcallCallConv := 65,LLVMARMAPCSCallConv := 66,
    LLVMARMAAPCSCallConv := 67,LLVMARMAAPCSVFPCallConv := 68,
    LLVMMSP430INTRCallConv := 69,LLVMX86ThisCallCallConv := 70,
    LLVMPTXKernelCallConv := 71,LLVMPTXDeviceCallConv := 72,
    LLVMSPIRFUNCCallConv := 75,LLVMSPIRKERNELCallConv := 76,
    LLVMIntelOCLBICallConv := 77,LLVMX8664SysVCallConv := 78,
    LLVMWin64CallConv := 79,LLVMX86VectorCallCallConv := 80,
    LLVMHHVMCallConv := 81,LLVMHHVMCCallConv := 82,
    LLVMX86INTRCallConv := 83,LLVMAVRINTRCallConv := 84,
    LLVMAVRSIGNALCallConv := 85,LLVMAVRBUILTINCallConv := 86,
    LLVMAMDGPUVSCallConv := 87,LLVMAMDGPUGSCallConv := 88,
    LLVMAMDGPUPSCallConv := 89,LLVMAMDGPUCSCallConv := 90,
    LLVMAMDGPUKERNELCallConv := 91,LLVMX86RegCallCallConv := 92,
    LLVMAMDGPUHSCallConv := 93,LLVMMSP430BUILTINCallConv := 94,
    LLVMAMDGPULSCallConv := 95,LLVMAMDGPUESCallConv := 96
    );

  LLVMValueKind = (LLVMArgumentValueKind,LLVMBasicBlockValueKind,
      LLVMMemoryUseValueKind,LLVMMemoryDefValueKind,
      LLVMMemoryPhiValueKind,LLVMFunctionValueKind,
      LLVMGlobalAliasValueKind,LLVMGlobalIFuncValueKind,
      LLVMGlobalVariableValueKind,LLVMBlockAddressValueKind,
      LLVMConstantExprValueKind,LLVMConstantArrayValueKind,
      LLVMConstantStructValueKind,LLVMConstantVectorValueKind,
      LLVMUndefValueValueKind,LLVMConstantAggregateZeroValueKind,
      LLVMConstantDataArrayValueKind,LLVMConstantDataVectorValueKind,
      LLVMConstantIntValueKind,LLVMConstantFPValueKind,
      LLVMConstantPointerNullValueKind,LLVMConstantTokenNoneValueKind,
      LLVMMetadataAsValueValueKind,LLVMInlineAsmValueKind,
      LLVMInstructionValueKind,LLVMPoisonValueValueKind,
      LLVMConstantTargetNoneValueKind);

  LLVMIntPredicate = (LLVMIntEQ := 32,LLVMIntNE,LLVMIntUGT,LLVMIntUGE,
      LLVMIntULT,LLVMIntULE,LLVMIntSGT,LLVMIntSGE,
      LLVMIntSLT,LLVMIntSLE);

  LLVMRealPredicate = (LLVMRealPredicateFalse,LLVMRealOEQ,LLVMRealOGT,
      LLVMRealOGE,LLVMRealOLT,LLVMRealOLE,LLVMRealONE,
      LLVMRealORD,LLVMRealUNO,LLVMRealUEQ,LLVMRealUGT,
      LLVMRealUGE,LLVMRealULT,LLVMRealULE,LLVMRealUNE,
      LLVMRealPredicateTrue);
  LLVMLandingPadClauseTy = (LLVMLandingPadCatch,LLVMLandingPadFilter
      );

  LLVMThreadLocalMode = (LLVMNotThreadLocal,LLVMGeneralDynamicTLSModel,
      LLVMLocalDynamicTLSModel,LLVMInitialExecTLSModel,
      LLVMLocalExecTLSModel);

  LLVMAtomicOrdering = (LLVMAtomicOrderingNotAtomic := 0,LLVMAtomicOrderingUnordered := 1,
    LLVMAtomicOrderingMonotonic := 2,LLVMAtomicOrderingAcquire := 4,
    LLVMAtomicOrderingRelease := 5,LLVMAtomicOrderingAcquireRelease := 6,
    LLVMAtomicOrderingSequentiallyConsistent := 7
    );

  LLVMAtomicRMWBinOp = (LLVMAtomicRMWBinOpXchg,LLVMAtomicRMWBinOpAdd,
    LLVMAtomicRMWBinOpSub,LLVMAtomicRMWBinOpAnd,
    LLVMAtomicRMWBinOpNand,LLVMAtomicRMWBinOpOr,
    LLVMAtomicRMWBinOpXor,LLVMAtomicRMWBinOpMax,
    LLVMAtomicRMWBinOpMin,LLVMAtomicRMWBinOpUMax,
    LLVMAtomicRMWBinOpUMin,LLVMAtomicRMWBinOpFAdd,
    LLVMAtomicRMWBinOpFSub,LLVMAtomicRMWBinOpFMax,
    LLVMAtomicRMWBinOpFMin);

  LLVMDiagnosticSeverity = (LLVMDSError,LLVMDSWarning,LLVMDSRemark,
    LLVMDSNote);

  LLVMInlineAsmDialect = (LLVMInlineAsmDialectATT,LLVMInlineAsmDialectIntel
    );

  LLVMModuleFlagBehavior = (LLVMModuleFlagBehaviorError,LLVMModuleFlagBehaviorWarning,
      LLVMModuleFlagBehaviorRequire,LLVMModuleFlagBehaviorOverride,
      LLVMModuleFlagBehaviorAppend,LLVMModuleFlagBehaviorAppendUnique
      );
  LLVMAttributeIndex = dword;

  LLVMDiagnosticHandler = procedure (_para1: LLVMDiagnosticInfoRef; _para2: pointer); cdecl;
  LLVMYieldCallback = procedure (_para1: LLVMContextRef; _para2: pointer); cdecl;

  procedure LLVMInitializeCore(R: LLVMPassRegistryRef); LibLLVM;
  procedure LLVMShutdown; LibLLVM;
  procedure LLVMGetVersion(out Major: dword; out Minor: dword; out Patch: dword); LibLLVM;
  function LLVMCreateMessage(Message: Pchar):PChar; LibLLVM;
  procedure LLVMDisposeMessage(Message: Pchar); LibLLVM;
  function LLVMContextCreate: LLVMContextRef; LibLLVM;
  function LLVMGetGlobalContext: LLVMContextRef; LibLLVM;
  procedure LLVMContextSetDiagnosticHandler(C: LLVMContextRef; Handler: LLVMDiagnosticHandler; DiagnosticContext: pointer); LibLLVM;
  function LLVMContextGetDiagnosticHandler(C: LLVMContextRef):LLVMDiagnosticHandler; LibLLVM;
  function LLVMContextGetDiagnosticContext(C: LLVMContextRef):pointer; LibLLVM;
  procedure LLVMContextSetYieldCallback(C: LLVMContextRef; Callback: LLVMYieldCallback; OpaqueHandle: pointer); LibLLVM;
  function LLVMContextShouldDiscardValueNames(C: LLVMContextRef):LLVMBool; LibLLVM;
  procedure LLVMContextSetDiscardValueNames(C: LLVMContextRef; Discard: LLVMBool); LibLLVM;
  procedure LLVMContextSetOpaquePointers(C: LLVMContextRef; OpaquePointers: LLVMBool); LibLLVM;
  procedure LLVMContextDispose(C: LLVMContextRef); LibLLVM;
  function LLVMGetDiagInfoDescription(DI: LLVMDiagnosticInfoRef):PChar; LibLLVM;
  function LLVMGetDiagInfoSeverity(DI: LLVMDiagnosticInfoRef):LLVMDiagnosticSeverity; LibLLVM;
  function LLVMGetMDKindIDInContext(C: LLVMContextRef; Name: Pchar; SLen: dword):dword; LibLLVM;
  function LLVMGetMDKindID(Name: Pchar; SLen: dword):dword; LibLLVM;
  function LLVMGetEnumAttributeKindForName(Name: Pchar; SLen: size_t):dword; LibLLVM;
  function LLVMGetLastEnumAttributeKind: dword; LibLLVM;
  function LLVMCreateEnumAttribute(C: LLVMContextRef; KindID: dword; Val: UInt64):LLVMAttributeRef; LibLLVM;
  function LLVMGetEnumAttributeKind(A: LLVMAttributeRef):dword; LibLLVM;
  function LLVMGetEnumAttributeValue(A: LLVMAttributeRef):UInt64; LibLLVM;
  function LLVMCreateTypeAttribute(C: LLVMContextRef; KindID: dword; type_ref: LLVMTypeRef):LLVMAttributeRef; LibLLVM;
  function LLVMGetTypeAttributeValue(A: LLVMAttributeRef):LLVMTypeRef; LibLLVM;
  function LLVMCreateStringAttribute(C: LLVMContextRef; K: Pchar; KLength: dword; V: Pchar; VLength: dword):LLVMAttributeRef; LibLLVM;
  function LLVMGetStringAttributeKind(A: LLVMAttributeRef; out Length: dword):PChar; LibLLVM;
  function LLVMGetStringAttributeValue(A: LLVMAttributeRef; out Length: dword):PChar; LibLLVM;
  function LLVMIsEnumAttribute(A: LLVMAttributeRef):LLVMBool; LibLLVM;
  function LLVMIsStringAttribute(A: LLVMAttributeRef):LLVMBool; LibLLVM;
  function LLVMIsTypeAttribute(A: LLVMAttributeRef):LLVMBool; LibLLVM;
  function LLVMGetTypeByName2(C: LLVMContextRef; Name: Pchar):LLVMTypeRef; LibLLVM;
  function LLVMModuleCreateWithName(ModuleID: Pchar):LLVMModuleRef; LibLLVM;
  function LLVMModuleCreateWithNameInContext(ModuleID: Pchar; C: LLVMContextRef):LLVMModuleRef; LibLLVM;
  function LLVMCloneModule(M: LLVMModuleRef):LLVMModuleRef; LibLLVM;
  procedure LLVMDisposeModule(M: LLVMModuleRef); LibLLVM;
  function LLVMGetModuleIdentifier(M: LLVMModuleRef; out Len: size_t):PChar; LibLLVM;
  procedure LLVMSetModuleIdentifier(M: LLVMModuleRef; Ident: Pchar; Len: size_t); LibLLVM;
  function LLVMGetSourceFileName(M: LLVMModuleRef; out Len: size_t):PChar; LibLLVM;
  procedure LLVMSetSourceFileName(M: LLVMModuleRef; Name: Pchar; Len: size_t); LibLLVM;
  function LLVMGetDataLayoutStr(M: LLVMModuleRef):PChar; LibLLVM;
  function LLVMGetDataLayout(M: LLVMModuleRef):PChar; LibLLVM;
  procedure LLVMSetDataLayout(M: LLVMModuleRef; DataLayoutStr: Pchar); LibLLVM;
  function LLVMGetTarget(M: LLVMModuleRef):PChar; LibLLVM;
  procedure LLVMSetTarget(M: LLVMModuleRef; Triple: Pchar); LibLLVM;
  function LLVMCopyModuleFlagsMetadata(M: LLVMModuleRef; out Len: size_t):PLLVMModuleFlagEntry; LibLLVM;
  procedure LLVMDisposeModuleFlagsMetadata(Entries: PLLVMModuleFlagEntry); LibLLVM;
  function LLVMModuleFlagEntriesGetFlagBehavior(Entries: PLLVMModuleFlagEntry; Index: dword):LLVMModuleFlagBehavior; LibLLVM;
  function LLVMModuleFlagEntriesGetKey(Entries: PLLVMModuleFlagEntry; Index: dword; out Len: size_t):PChar; LibLLVM;
  function LLVMModuleFlagEntriesGetMetadata(Entries: PLLVMModuleFlagEntry; Index: dword):LLVMMetadataRef; LibLLVM;
  function LLVMGetModuleFlag(M: LLVMModuleRef; Key: Pchar; KeyLen: size_t):LLVMMetadataRef; LibLLVM;
  procedure LLVMAddModuleFlag(M: LLVMModuleRef; Behavior: LLVMModuleFlagBehavior; Key: Pchar; KeyLen: size_t; Val: LLVMMetadataRef); LibLLVM;
  procedure LLVMDumpModule(M: LLVMModuleRef); LibLLVM;
  function LLVMPrintModuleToFile(M: LLVMModuleRef; Filename: Pchar; ErrorMessage: PPchar):LLVMBool; LibLLVM;
  function LLVMPrintModuleToString(M: LLVMModuleRef):PChar; LibLLVM;
  function LLVMGetModuleInlineAsm(M: LLVMModuleRef; out Len: size_t):PChar; LibLLVM;
  procedure LLVMSetModuleInlineAsm2(M: LLVMModuleRef; &Asm: Pchar; Len: size_t); LibLLVM;
  procedure LLVMAppendModuleInlineAsm(M: LLVMModuleRef; &Asm: Pchar; Len: size_t); LibLLVM;
  function LLVMGetInlineAsm(Ty: LLVMTypeRef; AsmString: Pchar; AsmStringSize: size_t; Constraints: Pchar; ConstraintsSize: size_t; 
             HasSideEffects: LLVMBool; IsAlignStack: LLVMBool; Dialect: LLVMInlineAsmDialect; CanThrow: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMGetModuleContext(M: LLVMModuleRef):LLVMContextRef; LibLLVM;
  function LLVMGetTypeByName(M: LLVMModuleRef; Name: Pchar):LLVMTypeRef; LibLLVM;
  function LLVMGetFirstNamedMetadata(M: LLVMModuleRef):LLVMNamedMDNodeRef; LibLLVM;
  function LLVMGetLastNamedMetadata(M: LLVMModuleRef):LLVMNamedMDNodeRef; LibLLVM;
  function LLVMGetNextNamedMetadata(NamedMDNode: LLVMNamedMDNodeRef):LLVMNamedMDNodeRef; LibLLVM;
  function LLVMGetPreviousNamedMetadata(NamedMDNode: LLVMNamedMDNodeRef):LLVMNamedMDNodeRef; LibLLVM;
  function LLVMGetNamedMetadata(M: LLVMModuleRef; Name: Pchar; NameLen: size_t):LLVMNamedMDNodeRef; LibLLVM;
  function LLVMGetOrInsertNamedMetadata(M: LLVMModuleRef; Name: Pchar; NameLen: size_t):LLVMNamedMDNodeRef; LibLLVM;
  function LLVMGetNamedMetadataName(NamedMD: LLVMNamedMDNodeRef; out NameLen: size_t):PChar; LibLLVM;
  function LLVMGetNamedMetadataNumOperands(M: LLVMModuleRef; Name: Pchar):dword; LibLLVM;
  procedure LLVMGetNamedMetadataOperands(M: LLVMModuleRef; Name: Pchar; Dest: PLLVMValueRef); LibLLVM;
  procedure LLVMAddNamedMetadataOperand(M: LLVMModuleRef; Name: Pchar; Val: LLVMValueRef); LibLLVM;
  function LLVMGetDebugLocDirectory(Val: LLVMValueRef; out Length: dword):PChar; LibLLVM;
  function LLVMGetDebugLocFilename(Val: LLVMValueRef; out Length: dword):PChar; LibLLVM;
  function LLVMGetDebugLocLine(Val: LLVMValueRef):dword; LibLLVM;
  function LLVMGetDebugLocColumn(Val: LLVMValueRef):dword; LibLLVM;
  function LLVMAddFunction(M: LLVMModuleRef; Name: Pchar; FunctionTy: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMGetNamedFunction(M: LLVMModuleRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMGetFirstFunction(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetLastFunction(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetNextFunction(Fn: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetPreviousFunction(Fn: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMSetModuleInlineAsm(M: LLVMModuleRef; &Asm: Pchar); LibLLVM;
  function LLVMGetTypeKind(Ty: LLVMTypeRef):LLVMTypeKind; LibLLVM;
  function LLVMTypeIsSized(Ty: LLVMTypeRef):LLVMBool; LibLLVM;
  function LLVMGetTypeContext(Ty: LLVMTypeRef):LLVMContextRef; LibLLVM;
  procedure LLVMDumpType(Val: LLVMTypeRef); LibLLVM;
  function LLVMPrintTypeToString(Val: LLVMTypeRef):PChar; LibLLVM;
  function LLVMInt1TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMInt8TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMInt16TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMInt32TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMInt64TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMInt128TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMIntTypeInContext(C: LLVMContextRef; NumBits: dword):LLVMTypeRef; LibLLVM;
  function LLVMInt1Type: LLVMTypeRef; LibLLVM;
  function LLVMInt8Type: LLVMTypeRef; LibLLVM;
  function LLVMInt16Type: LLVMTypeRef; LibLLVM;
  function LLVMInt32Type: LLVMTypeRef; LibLLVM;
  function LLVMInt64Type: LLVMTypeRef; LibLLVM;
  function LLVMInt128Type: LLVMTypeRef; LibLLVM;
  function LLVMIntType(NumBits: dword):LLVMTypeRef; LibLLVM;
  function LLVMGetIntTypeWidth(IntegerTy: LLVMTypeRef):dword; LibLLVM;
  function LLVMHalfTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMBFloatTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMFloatTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMDoubleTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMX86FP80TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMFP128TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMPPCFP128TypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMHalfType: LLVMTypeRef; LibLLVM;
  function LLVMBFloatType: LLVMTypeRef; LibLLVM;
  function LLVMFloatType: LLVMTypeRef; LibLLVM;
  function LLVMDoubleType: LLVMTypeRef; LibLLVM;
  function LLVMX86FP80Type: LLVMTypeRef; LibLLVM;
  function LLVMFP128Type: LLVMTypeRef; LibLLVM;
  function LLVMPPCFP128Type: LLVMTypeRef; LibLLVM;
  function LLVMFunctionType(ReturnType: LLVMTypeRef; ParamTypes: PLLVMTypeRef; ParamCount: dword; IsVarArg: LLVMBool):LLVMTypeRef; LibLLVM;
  function LLVMIsFunctionVarArg(FunctionTy: LLVMTypeRef):LLVMBool; LibLLVM;
  function LLVMGetReturnType(FunctionTy: LLVMTypeRef):LLVMTypeRef; LibLLVM;
  function LLVMCountParamTypes(FunctionTy: LLVMTypeRef):dword; LibLLVM;
  procedure LLVMGetParamTypes(FunctionTy: LLVMTypeRef; Dest: PLLVMTypeRef); LibLLVM;
  function LLVMStructTypeInContext(C: LLVMContextRef; ElementTypes: PLLVMTypeRef; ElementCount: dword; &Packed: LLVMBool):LLVMTypeRef; LibLLVM;
  function LLVMStructType(ElementTypes: PLLVMTypeRef; ElementCount: dword; &Packed: LLVMBool):LLVMTypeRef; LibLLVM;
  function LLVMStructCreateNamed(C: LLVMContextRef; Name: Pchar):LLVMTypeRef; LibLLVM;
  function LLVMGetStructName(Ty: LLVMTypeRef):PChar; LibLLVM;
  procedure LLVMStructSetBody(StructTy: LLVMTypeRef; ElementTypes: PLLVMTypeRef; ElementCount: dword; &Packed: LLVMBool); LibLLVM;
  function LLVMCountStructElementTypes(StructTy: LLVMTypeRef):dword; LibLLVM;
  procedure LLVMGetStructElementTypes(StructTy: LLVMTypeRef; Dest: PLLVMTypeRef); LibLLVM;
  function LLVMStructGetTypeAtIndex(StructTy: LLVMTypeRef; i: dword):LLVMTypeRef; LibLLVM;
  function LLVMIsPackedStruct(StructTy: LLVMTypeRef):LLVMBool; LibLLVM;
  function LLVMIsOpaqueStruct(StructTy: LLVMTypeRef):LLVMBool; LibLLVM;
  function LLVMIsLiteralStruct(StructTy: LLVMTypeRef):LLVMBool; LibLLVM;
  function LLVMGetElementType(Ty: LLVMTypeRef):LLVMTypeRef; LibLLVM;
  procedure LLVMGetSubtypes(Tp: LLVMTypeRef; Arr: PLLVMTypeRef); LibLLVM;
  function LLVMGetNumContainedTypes(Tp: LLVMTypeRef):dword; LibLLVM;
  function LLVMArrayType(ElementType: LLVMTypeRef; ElementCount: dword):LLVMTypeRef; LibLLVM;
  function LLVMGetArrayLength(ArrayTy: LLVMTypeRef):dword; LibLLVM;
  function LLVMPointerType(ElementType: LLVMTypeRef; AddressSpace: dword):LLVMTypeRef; LibLLVM;
  function LLVMPointerTypeIsOpaque(Ty: LLVMTypeRef):LLVMBool; LibLLVM;
  function LLVMPointerTypeInContext(C: LLVMContextRef; AddressSpace: dword):LLVMTypeRef; LibLLVM;
  function LLVMGetPointerAddressSpace(PointerTy: LLVMTypeRef):dword; LibLLVM;
  function LLVMVectorType(ElementType: LLVMTypeRef; ElementCount: dword):LLVMTypeRef; LibLLVM;
  function LLVMScalableVectorType(ElementType: LLVMTypeRef; ElementCount: dword):LLVMTypeRef; LibLLVM;
  function LLVMGetVectorSize(VectorTy: LLVMTypeRef):dword; LibLLVM;
  function LLVMVoidTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMLabelTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMX86MMXTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMX86AMXTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMTokenTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMMetadataTypeInContext(C: LLVMContextRef):LLVMTypeRef; LibLLVM;
  function LLVMVoidType: LLVMTypeRef; LibLLVM;
  function LLVMLabelType: LLVMTypeRef; LibLLVM;
  function LLVMX86MMXType: LLVMTypeRef; LibLLVM;
  function LLVMX86AMXType: LLVMTypeRef; LibLLVM;
  function LLVMTargetExtTypeInContext(C: LLVMContextRef; Name: Pchar; TypeParams: PLLVMTypeRef; TypeParamCount: dword; IntParams: Pdword; 
             IntParamCount: dword):LLVMTypeRef; LibLLVM;
  function LLVMTypeOf(Val: LLVMValueRef):LLVMTypeRef; LibLLVM;
  function LLVMGetValueKind(Val: LLVMValueRef):LLVMValueKind; LibLLVM;
  function LLVMGetValueName2(Val: LLVMValueRef; out Length: size_t):PChar; LibLLVM;
  procedure LLVMSetValueName2(Val: LLVMValueRef; Name: Pchar; NameLen: size_t); LibLLVM;
  procedure LLVMDumpValue(Val: LLVMValueRef); LibLLVM;
  function LLVMPrintValueToString(Val: LLVMValueRef):PChar; LibLLVM;
  procedure LLVMReplaceAllUsesWith(OldVal: LLVMValueRef; NewVal: LLVMValueRef); LibLLVM;
  function LLVMIsConstant(Val: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMIsUndef(Val: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMIsPoison(Val: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMIsAMDString(Val: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetValueName(Val: LLVMValueRef):PChar; LibLLVM;
  procedure LLVMSetValueName(Val: LLVMValueRef; Name: Pchar); LibLLVM;
  function LLVMGetFirstUse(Val: LLVMValueRef):LLVMUseRef; LibLLVM;
  function LLVMGetNextUse(U: LLVMUseRef):LLVMUseRef; LibLLVM;
  function LLVMGetUser(U: LLVMUseRef):LLVMValueRef; LibLLVM;
  function LLVMGetUsedValue(U: LLVMUseRef):LLVMValueRef; LibLLVM;
  function LLVMGetOperand(Val: LLVMValueRef; Index: dword):LLVMValueRef; LibLLVM;
  function LLVMGetOperandUse(Val: LLVMValueRef; Index: dword):LLVMUseRef; LibLLVM;
  procedure LLVMSetOperand(User: LLVMValueRef; Index: dword; Val: LLVMValueRef); LibLLVM;
  function LLVMGetNumOperands(Val: LLVMValueRef):longint; LibLLVM;
  function LLVMConstNull(Ty: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstAllOnes(Ty: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMGetUndef(Ty: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMGetPoison(Ty: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMIsNull(Val: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMConstPointerNull(Ty: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstInt(IntTy: LLVMTypeRef; N: qword; SignExtend: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMConstIntOfArbitraryPrecision(IntTy: LLVMTypeRef; NumWords: dword; Words: PUInt64):LLVMValueRef; LibLLVM;
  function LLVMConstIntOfString(IntTy: LLVMTypeRef; Text: Pchar; Radix: uint8):LLVMValueRef; LibLLVM;
  function LLVMConstIntOfStringAndSize(IntTy: LLVMTypeRef; Text: Pchar; SLen: dword; Radix: uint8):LLVMValueRef; LibLLVM;
  function LLVMConstReal(RealTy: LLVMTypeRef; N: double):LLVMValueRef; LibLLVM;
  function LLVMConstRealOfString(RealTy: LLVMTypeRef; Text: Pchar):LLVMValueRef; LibLLVM;
  function LLVMConstRealOfStringAndSize(RealTy: LLVMTypeRef; Text: Pchar; SLen: dword):LLVMValueRef; LibLLVM;
  function LLVMConstIntGetZExtValue(ConstantVal: LLVMValueRef):qword; LibLLVM;
  function LLVMConstIntGetSExtValue(ConstantVal: LLVMValueRef):int64; LibLLVM;
  function LLVMConstRealGetDouble(ConstantVal: LLVMValueRef; losesInfo: PLLVMBool):double; LibLLVM;
  function LLVMConstStringInContext(C: LLVMContextRef; Str: Pchar; Length: dword; DontNullTerminate: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMConstString(Str: Pchar; Length: dword; DontNullTerminate: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMIsConstantString(c: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMGetAsString(c: LLVMValueRef; out Length: size_t):PChar; LibLLVM;
  function LLVMConstStructInContext(C: LLVMContextRef; ConstantVals: PLLVMValueRef; Count: dword; &Packed: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMConstStruct(ConstantVals: PLLVMValueRef; Count: dword; &Packed: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMConstArray(ElementTy: LLVMTypeRef; ConstantVals: PLLVMValueRef; Length: dword):LLVMValueRef; LibLLVM;
  function LLVMConstNamedStruct(StructTy: LLVMTypeRef; ConstantVals: PLLVMValueRef; Count: dword):LLVMValueRef; LibLLVM;
  function LLVMGetAggregateElement(C: LLVMValueRef; Idx: dword):LLVMValueRef; LibLLVM;
  function LLVMConstVector(ScalarConstantVals: PLLVMValueRef; Size: dword):LLVMValueRef; LibLLVM;
  function LLVMGetConstOpcode(ConstantVal: LLVMValueRef):LLVMOpcode; LibLLVM;
  function LLVMAlignOf(Ty: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMSizeOf(Ty: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstNeg(ConstantVal: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNSWNeg(ConstantVal: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNUWNeg(ConstantVal: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNot(ConstantVal: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstAdd(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNSWAdd(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNUWAdd(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstSub(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNSWSub(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNUWSub(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstMul(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNSWMul(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstNUWMul(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstAnd(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstOr(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstXor(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstICmp(Predicate: LLVMIntPredicate; LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstFCmp(Predicate: LLVMRealPredicate; LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstShl(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstLShr(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstAShr(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstGEP2(Ty: LLVMTypeRef; ConstantVal: LLVMValueRef; ConstantIndices: PLLVMValueRef; NumIndices: dword):LLVMValueRef; LibLLVM;
  function LLVMConstInBoundsGEP2(Ty: LLVMTypeRef; ConstantVal: LLVMValueRef; ConstantIndices: PLLVMValueRef; NumIndices: dword):LLVMValueRef; LibLLVM;
  function LLVMConstTrunc(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstSExt(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstZExt(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstFPTrunc(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstFPExt(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstUIToFP(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstSIToFP(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstFPToUI(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstFPToSI(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstPtrToInt(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstIntToPtr(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstBitCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstAddrSpaceCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstZExtOrBitCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstSExtOrBitCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstTruncOrBitCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstPointerCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstIntCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef; isSigned: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMConstFPCast(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef):LLVMValueRef; LibLLVM;
  function LLVMConstSelect(ConstantCondition: LLVMValueRef; ConstantIfTrue: LLVMValueRef; ConstantIfFalse: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstExtractElement(VectorConstant: LLVMValueRef; IndexConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstInsertElement(VectorConstant: LLVMValueRef; ElementValueConstant: LLVMValueRef; IndexConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMConstShuffleVector(VectorAConstant: LLVMValueRef; VectorBConstant: LLVMValueRef; MaskConstant: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMBlockAddress(F: LLVMValueRef; BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMConstInlineAsm(Ty: LLVMTypeRef; AsmString: Pchar; Constraints: Pchar; HasSideEffects: LLVMBool; IsAlignStack: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMGetGlobalParent(Global: LLVMValueRef):LLVMModuleRef; LibLLVM;
  function LLVMIsDeclaration(Global: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMGetLinkage(Global: LLVMValueRef):LLVMLinkage; LibLLVM;
  procedure LLVMSetLinkage(Global: LLVMValueRef; Linkage: LLVMLinkage); LibLLVM;
  function LLVMGetSection(Global: LLVMValueRef):PChar; LibLLVM;
  procedure LLVMSetSection(Global: LLVMValueRef; Section: Pchar); LibLLVM;
  function LLVMGetVisibility(Global: LLVMValueRef):LLVMVisibility; LibLLVM;
  procedure LLVMSetVisibility(Global: LLVMValueRef; Viz: LLVMVisibility); LibLLVM;
  function LLVMGetDLLStorageClass(Global: LLVMValueRef):LLVMDLLStorageClass; LibLLVM;
  procedure LLVMSetDLLStorageClass(Global: LLVMValueRef; _Class: LLVMDLLStorageClass); LibLLVM;
  function LLVMGetUnnamedAddress(Global: LLVMValueRef):LLVMUnnamedAddr; LibLLVM;
  procedure LLVMSetUnnamedAddress(Global: LLVMValueRef; UnnamedAddr: LLVMUnnamedAddr); LibLLVM;
  function LLVMGlobalGetValueType(Global: LLVMValueRef):LLVMTypeRef; LibLLVM;
  function LLVMHasUnnamedAddr(Global: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetUnnamedAddr(Global: LLVMValueRef; HasUnnamedAddr: LLVMBool); LibLLVM;
  function LLVMGetAlignment(V: LLVMValueRef):dword; LibLLVM;
  procedure LLVMSetAlignment(V: LLVMValueRef; Bytes: dword); LibLLVM;
  procedure LLVMGlobalSetMetadata(Global: LLVMValueRef; Kind: dword; MD: LLVMMetadataRef); LibLLVM;
  procedure LLVMGlobalEraseMetadata(Global: LLVMValueRef; Kind: dword); LibLLVM;
  procedure LLVMGlobalClearMetadata(Global: LLVMValueRef); LibLLVM;
  function LLVMGlobalCopyAllMetadata(Value: LLVMValueRef; out NumEntries: size_t):PLLVMValueMetadataEntry; LibLLVM;
  procedure LLVMDisposeValueMetadataEntries(Entries: PLLVMValueMetadataEntry); LibLLVM;
  function LLVMValueMetadataEntriesGetKind(Entries: PLLVMValueMetadataEntry; Index: dword):dword; LibLLVM;
  function LLVMValueMetadataEntriesGetMetadata(Entries: PLLVMValueMetadataEntry; Index: dword):LLVMMetadataRef; LibLLVM;
  function LLVMAddGlobal(M: LLVMModuleRef; Ty: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMAddGlobalInAddressSpace(M: LLVMModuleRef; Ty: LLVMTypeRef; Name: Pchar; AddressSpace: dword):LLVMValueRef; LibLLVM;
  function LLVMGetNamedGlobal(M: LLVMModuleRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMGetFirstGlobal(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetLastGlobal(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetNextGlobal(GlobalVar: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetPreviousGlobal(GlobalVar: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMDeleteGlobal(GlobalVar: LLVMValueRef); LibLLVM;
  function LLVMGetInitializer(GlobalVar: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMSetInitializer(GlobalVar: LLVMValueRef; ConstantVal: LLVMValueRef); LibLLVM;
  function LLVMIsThreadLocal(GlobalVar: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetThreadLocal(GlobalVar: LLVMValueRef; IsThreadLocal: LLVMBool); LibLLVM;
  function LLVMIsGlobalConstant(GlobalVar: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetGlobalConstant(GlobalVar: LLVMValueRef; IsConstant: LLVMBool); LibLLVM;
  function LLVMGetThreadLocalMode(GlobalVar: LLVMValueRef):LLVMThreadLocalMode; LibLLVM;
  procedure LLVMSetThreadLocalMode(GlobalVar: LLVMValueRef; Mode: LLVMThreadLocalMode); LibLLVM;
  function LLVMIsExternallyInitialized(GlobalVar: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetExternallyInitialized(GlobalVar: LLVMValueRef; IsExtInit: LLVMBool); LibLLVM;
  function LLVMAddAlias2(M: LLVMModuleRef; ValueTy: LLVMTypeRef; AddrSpace: dword; Aliasee: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMGetNamedGlobalAlias(M: LLVMModuleRef; Name: Pchar; NameLen: size_t):LLVMValueRef; LibLLVM;
  function LLVMGetFirstGlobalAlias(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetLastGlobalAlias(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetNextGlobalAlias(GA: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetPreviousGlobalAlias(GA: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMAliasGetAliasee(Alias: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMAliasSetAliasee(Alias: LLVMValueRef; Aliasee: LLVMValueRef); LibLLVM;
  procedure LLVMDeleteFunction(Fn: LLVMValueRef); LibLLVM;
  function LLVMHasPersonalityFn(Fn: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMGetPersonalityFn(Fn: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMSetPersonalityFn(Fn: LLVMValueRef; PersonalityFn: LLVMValueRef); LibLLVM;
  function LLVMLookupIntrinsicID(Name: Pchar; NameLen: size_t):dword; LibLLVM;
  function LLVMGetIntrinsicID(Fn: LLVMValueRef):dword; LibLLVM;
  function LLVMGetIntrinsicDeclaration(&Mod: LLVMModuleRef; ID: dword; ParamTypes: PLLVMTypeRef; ParamCount: size_t):LLVMValueRef; LibLLVM;
  function LLVMIntrinsicGetType(Ctx: LLVMContextRef; ID: dword; ParamTypes: PLLVMTypeRef; ParamCount: size_t):LLVMTypeRef; LibLLVM;
  function LLVMIntrinsicGetName(ID: dword; out NameLength: size_t):PChar; LibLLVM;
  function LLVMIntrinsicCopyOverloadedName(ID: dword; ParamTypes: PLLVMTypeRef; ParamCount: size_t; out NameLength: size_t):PChar; LibLLVM;
  function LLVMIntrinsicCopyOverloadedName2(&Mod: LLVMModuleRef; ID: dword; ParamTypes: PLLVMTypeRef; ParamCount: size_t; out NameLength: size_t):PChar; LibLLVM;
  function LLVMIntrinsicIsOverloaded(ID: dword):LLVMBool; LibLLVM;
  function LLVMGetFunctionCallConv(Fn: LLVMValueRef):dword; LibLLVM;
  procedure LLVMSetFunctionCallConv(Fn: LLVMValueRef; CC: dword); LibLLVM;
  function LLVMGetGC(Fn: LLVMValueRef):PChar; LibLLVM;
  procedure LLVMSetGC(Fn: LLVMValueRef; Name: Pchar); LibLLVM;
  procedure LLVMAddAttributeAtIndex(F: LLVMValueRef; Idx: LLVMAttributeIndex; A: LLVMAttributeRef); LibLLVM;
  function LLVMGetAttributeCountAtIndex(F: LLVMValueRef; Idx: LLVMAttributeIndex):dword; LibLLVM;
  procedure LLVMGetAttributesAtIndex(F: LLVMValueRef; Idx: LLVMAttributeIndex; Attrs: PLLVMAttributeRef); LibLLVM;
  function LLVMGetEnumAttributeAtIndex(F: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: dword):LLVMAttributeRef; LibLLVM;
  function LLVMGetStringAttributeAtIndex(F: LLVMValueRef; Idx: LLVMAttributeIndex; K: Pchar; KLen: dword):LLVMAttributeRef; LibLLVM;
  procedure LLVMRemoveEnumAttributeAtIndex(F: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: dword); LibLLVM;
  procedure LLVMRemoveStringAttributeAtIndex(F: LLVMValueRef; Idx: LLVMAttributeIndex; K: Pchar; KLen: dword); LibLLVM;
  procedure LLVMAddTargetDependentFunctionAttr(Fn: LLVMValueRef; A: Pchar; V: Pchar); LibLLVM;
  function LLVMCountParams(Fn: LLVMValueRef):dword; LibLLVM;
  procedure LLVMGetParams(Fn: LLVMValueRef; Params: PLLVMValueRef); LibLLVM;
  function LLVMGetParam(Fn: LLVMValueRef; Index: dword):LLVMValueRef; LibLLVM;
  function LLVMGetParamParent(Inst: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetFirstParam(Fn: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetLastParam(Fn: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetNextParam(Arg: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetPreviousParam(Arg: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMSetParamAlignment(Arg: LLVMValueRef; Align: dword); LibLLVM;
  function LLVMAddGlobalIFunc(M: LLVMModuleRef; Name: Pchar; NameLen: size_t; Ty: LLVMTypeRef; AddrSpace: dword; 
             Resolver: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetNamedGlobalIFunc(M: LLVMModuleRef; Name: Pchar; NameLen: size_t):LLVMValueRef; LibLLVM;
  function LLVMGetFirstGlobalIFunc(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetLastGlobalIFunc(M: LLVMModuleRef):LLVMValueRef; LibLLVM;
  function LLVMGetNextGlobalIFunc(IFunc: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetPreviousGlobalIFunc(IFunc: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetGlobalIFuncResolver(IFunc: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMSetGlobalIFuncResolver(IFunc: LLVMValueRef; Resolver: LLVMValueRef); LibLLVM;
  procedure LLVMEraseGlobalIFunc(IFunc: LLVMValueRef); LibLLVM;
  procedure LLVMRemoveGlobalIFunc(IFunc: LLVMValueRef); LibLLVM;
  function LLVMMDStringInContext2(C: LLVMContextRef; Str: Pchar; SLen: size_t):LLVMMetadataRef; LibLLVM;
  function LLVMMDNodeInContext2(C: LLVMContextRef; MDs: PLLVMMetadataRef; Count: size_t):LLVMMetadataRef; LibLLVM;
  function LLVMMetadataAsValue(C: LLVMContextRef; MD: LLVMMetadataRef):LLVMValueRef; LibLLVM;
  function LLVMValueAsMetadata(Val: LLVMValueRef):LLVMMetadataRef; LibLLVM;
  function LLVMGetMDString(V: LLVMValueRef; out Length: dword):PChar; LibLLVM;
  function LLVMGetMDNodeNumOperands(V: LLVMValueRef):dword; LibLLVM;
  procedure LLVMGetMDNodeOperands(V: LLVMValueRef; Dest: PLLVMValueRef); LibLLVM;
  function LLVMMDStringInContext(C: LLVMContextRef; Str: Pchar; SLen: dword):LLVMValueRef; LibLLVM;
  function LLVMMDString(Str: Pchar; SLen: dword):LLVMValueRef; LibLLVM;
  function LLVMMDNodeInContext(C: LLVMContextRef; Vals: PLLVMValueRef; Count: dword):LLVMValueRef; LibLLVM;
  function LLVMMDNode(Vals: PLLVMValueRef; Count: dword):LLVMValueRef; LibLLVM;
  function LLVMBasicBlockAsValue(BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMValueIsBasicBlock(Val: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMValueAsBasicBlock(Val: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetBasicBlockName(BB: LLVMBasicBlockRef):PChar; LibLLVM;
  function LLVMGetBasicBlockParent(BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMGetBasicBlockTerminator(BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMCountBasicBlocks(Fn: LLVMValueRef):dword; LibLLVM;
  procedure LLVMGetBasicBlocks(Fn: LLVMValueRef; BasicBlocks: PLLVMBasicBlockRef); LibLLVM;
  function LLVMGetFirstBasicBlock(Fn: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetLastBasicBlock(Fn: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetNextBasicBlock(BB: LLVMBasicBlockRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetPreviousBasicBlock(BB: LLVMBasicBlockRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetEntryBasicBlock(Fn: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  procedure LLVMInsertExistingBasicBlockAfterInsertBlock(Builder: LLVMBuilderRef; BB: LLVMBasicBlockRef); LibLLVM;
  procedure LLVMAppendExistingBasicBlock(Fn: LLVMValueRef; BB: LLVMBasicBlockRef); LibLLVM;
  function LLVMCreateBasicBlockInContext(C: LLVMContextRef; Name: Pchar):LLVMBasicBlockRef; LibLLVM;
  function LLVMAppendBasicBlockInContext(C: LLVMContextRef; Fn: LLVMValueRef; Name: Pchar):LLVMBasicBlockRef; LibLLVM;
  function LLVMAppendBasicBlock(Fn: LLVMValueRef; Name: Pchar):LLVMBasicBlockRef; LibLLVM;
  function LLVMInsertBasicBlockInContext(C: LLVMContextRef; BB: LLVMBasicBlockRef; Name: Pchar):LLVMBasicBlockRef; LibLLVM;
  function LLVMInsertBasicBlock(InsertBeforeBB: LLVMBasicBlockRef; Name: Pchar):LLVMBasicBlockRef; LibLLVM;
  procedure LLVMDeleteBasicBlock(BB: LLVMBasicBlockRef); LibLLVM;
  procedure LLVMRemoveBasicBlockFromParent(BB: LLVMBasicBlockRef); LibLLVM;
  procedure LLVMMoveBasicBlockBefore(BB: LLVMBasicBlockRef; MovePos: LLVMBasicBlockRef); LibLLVM;
  procedure LLVMMoveBasicBlockAfter(BB: LLVMBasicBlockRef; MovePos: LLVMBasicBlockRef); LibLLVM;
  function LLVMGetFirstInstruction(BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMGetLastInstruction(BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMHasMetadata(Val: LLVMValueRef):longint; LibLLVM;
  function LLVMGetMetadata(Val: LLVMValueRef; KindID: dword):LLVMValueRef; LibLLVM;
  procedure LLVMSetMetadata(Val: LLVMValueRef; KindID: dword; Node: LLVMValueRef); LibLLVM;
  function LLVMInstructionGetAllMetadataOtherThanDebugLoc(Instr: LLVMValueRef; out NumEntries: size_t):PLLVMValueMetadataEntry; LibLLVM;
  function LLVMGetInstructionParent(Inst: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetNextInstruction(Inst: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetPreviousInstruction(Inst: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMInstructionRemoveFromParent(Inst: LLVMValueRef); LibLLVM;
  procedure LLVMInstructionEraseFromParent(Inst: LLVMValueRef); LibLLVM;
  procedure LLVMDeleteInstruction(Inst: LLVMValueRef); LibLLVM;
  function LLVMGetInstructionOpcode(Inst: LLVMValueRef):LLVMOpcode; LibLLVM;
  function LLVMGetICmpPredicate(Inst: LLVMValueRef):LLVMIntPredicate; LibLLVM;
  function LLVMGetFCmpPredicate(Inst: LLVMValueRef):LLVMRealPredicate; LibLLVM;
  function LLVMInstructionClone(Inst: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMIsATerminatorInst(Inst: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMGetNumArgOperands(Instr: LLVMValueRef):dword; LibLLVM;
  procedure LLVMSetInstructionCallConv(Instr: LLVMValueRef; CC: dword); LibLLVM;
  function LLVMGetInstructionCallConv(Instr: LLVMValueRef):dword; LibLLVM;
  procedure LLVMSetInstrParamAlignment(Instr: LLVMValueRef; Idx: LLVMAttributeIndex; Align: dword); LibLLVM;
  procedure LLVMAddCallSiteAttribute(C: LLVMValueRef; Idx: LLVMAttributeIndex; A: LLVMAttributeRef); LibLLVM;
  function LLVMGetCallSiteAttributeCount(C: LLVMValueRef; Idx: LLVMAttributeIndex):dword; LibLLVM;
  procedure LLVMGetCallSiteAttributes(C: LLVMValueRef; Idx: LLVMAttributeIndex; Attrs: PLLVMAttributeRef); LibLLVM;
  function LLVMGetCallSiteEnumAttribute(C: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: dword):LLVMAttributeRef; LibLLVM;
  function LLVMGetCallSiteStringAttribute(C: LLVMValueRef; Idx: LLVMAttributeIndex; K: Pchar; KLen: dword):LLVMAttributeRef; LibLLVM;
  procedure LLVMRemoveCallSiteEnumAttribute(C: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: dword); LibLLVM;
  procedure LLVMRemoveCallSiteStringAttribute(C: LLVMValueRef; Idx: LLVMAttributeIndex; K: Pchar; KLen: dword); LibLLVM;
  function LLVMGetCalledFunctionType(C: LLVMValueRef):LLVMTypeRef; LibLLVM;
  function LLVMGetCalledValue(Instr: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMIsTailCall(CallInst: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetTailCall(CallInst: LLVMValueRef; IsTailCall: LLVMBool); LibLLVM;
  function LLVMGetNormalDest(InvokeInst: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetUnwindDest(InvokeInst: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  procedure LLVMSetNormalDest(InvokeInst: LLVMValueRef; B: LLVMBasicBlockRef); LibLLVM;
  procedure LLVMSetUnwindDest(InvokeInst: LLVMValueRef; B: LLVMBasicBlockRef); LibLLVM;
  function LLVMGetNumSuccessors(Term: LLVMValueRef):dword; LibLLVM;
  function LLVMGetSuccessor(Term: LLVMValueRef; i: dword):LLVMBasicBlockRef; LibLLVM;
  procedure LLVMSetSuccessor(Term: LLVMValueRef; i: dword; block: LLVMBasicBlockRef); LibLLVM;
  function LLVMIsConditional(Branch: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMGetCondition(Branch: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMSetCondition(Branch: LLVMValueRef; Cond: LLVMValueRef); LibLLVM;
  function LLVMGetSwitchDefaultDest(SwitchInstr: LLVMValueRef):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetAllocatedType(Alloca: LLVMValueRef):LLVMTypeRef; LibLLVM;
  function LLVMIsInBounds(GEP: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetIsInBounds(GEP: LLVMValueRef; InBounds: LLVMBool); LibLLVM;
  function LLVMGetGEPSourceElementType(GEP: LLVMValueRef):LLVMTypeRef; LibLLVM;
  procedure LLVMAddIncoming(PhiNode: LLVMValueRef; IncomingValues: PLLVMValueRef; IncomingBlocks: PLLVMBasicBlockRef; Count: dword); LibLLVM;
  function LLVMCountIncoming(PhiNode: LLVMValueRef):dword; LibLLVM;
  function LLVMGetIncomingValue(PhiNode: LLVMValueRef; Index: dword):LLVMValueRef; LibLLVM;
  function LLVMGetIncomingBlock(PhiNode: LLVMValueRef; Index: dword):LLVMBasicBlockRef; LibLLVM;
  function LLVMGetNumIndices(Inst: LLVMValueRef):dword; LibLLVM;
  function LLVMGetIndices(Inst: LLVMValueRef):Pdword; LibLLVM;
  function LLVMCreateBuilderInContext(C: LLVMContextRef):LLVMBuilderRef; LibLLVM;
  function LLVMCreateBuilder: LLVMBuilderRef; LibLLVM;
  procedure LLVMPositionBuilder(Builder: LLVMBuilderRef; Block: LLVMBasicBlockRef; Instr: LLVMValueRef); LibLLVM;
  procedure LLVMPositionBuilderBefore(Builder: LLVMBuilderRef; Instr: LLVMValueRef); LibLLVM;
  procedure LLVMPositionBuilderAtEnd(Builder: LLVMBuilderRef; Block: LLVMBasicBlockRef); LibLLVM;
  function LLVMGetInsertBlock(Builder: LLVMBuilderRef):LLVMBasicBlockRef; LibLLVM;
  procedure LLVMClearInsertionPosition(Builder: LLVMBuilderRef); LibLLVM;
  procedure LLVMInsertIntoBuilder(Builder: LLVMBuilderRef; Instr: LLVMValueRef); LibLLVM;
  procedure LLVMInsertIntoBuilderWithName(Builder: LLVMBuilderRef; Instr: LLVMValueRef; Name: Pchar); LibLLVM;
  procedure LLVMDisposeBuilder(Builder: LLVMBuilderRef); LibLLVM;
  function LLVMGetCurrentDebugLocation2(Builder: LLVMBuilderRef):LLVMMetadataRef; LibLLVM;
  procedure LLVMSetCurrentDebugLocation2(Builder: LLVMBuilderRef; Loc: LLVMMetadataRef); LibLLVM;
  procedure LLVMSetInstDebugLocation(Builder: LLVMBuilderRef; Inst: LLVMValueRef); LibLLVM;
  procedure LLVMAddMetadataToInst(Builder: LLVMBuilderRef; Inst: LLVMValueRef); LibLLVM;
  function LLVMBuilderGetDefaultFPMathTag(Builder: LLVMBuilderRef):LLVMMetadataRef; LibLLVM;
  procedure LLVMBuilderSetDefaultFPMathTag(Builder: LLVMBuilderRef; FPMathTag: LLVMMetadataRef); LibLLVM;
  procedure LLVMSetCurrentDebugLocation(Builder: LLVMBuilderRef; L: LLVMValueRef); LibLLVM;
  function LLVMGetCurrentDebugLocation(Builder: LLVMBuilderRef):LLVMValueRef; LibLLVM;
  function LLVMBuildRetVoid(Builder: LLVMBuilderRef):LLVMValueRef; LibLLVM;
  function LLVMBuildRet(Builder: LLVMBuilderRef; V: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMBuildAggregateRet(Builder: LLVMBuilderRef; RetVals: PLLVMValueRef; N: dword):LLVMValueRef; LibLLVM;
  function LLVMBuildBr(Builder: LLVMBuilderRef; Dest: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMBuildCondBr(Builder: LLVMBuilderRef; &If: LLVMValueRef; &Then: LLVMBasicBlockRef; &Else: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMBuildSwitch(Builder: LLVMBuilderRef; V: LLVMValueRef; &Else: LLVMBasicBlockRef; NumCases: dword):LLVMValueRef; LibLLVM;
  function LLVMBuildIndirectBr(Builder: LLVMBuilderRef; Addr: LLVMValueRef; NumDests: dword):LLVMValueRef; LibLLVM;
  function LLVMBuildInvoke2(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Fn: LLVMValueRef; Args: PLLVMValueRef; NumArgs: dword; 
             &Then: LLVMBasicBlockRef; Catch: LLVMBasicBlockRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildUnreachable(Builder: LLVMBuilderRef):LLVMValueRef; LibLLVM;
  function LLVMBuildResume(Builder: LLVMBuilderRef; Exn: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMBuildLandingPad(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; PersFn: LLVMValueRef; NumClauses: dword; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildCleanupRet(Builder: LLVMBuilderRef; CatchPad: LLVMValueRef; BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMBuildCatchRet(Builder: LLVMBuilderRef; CatchPad: LLVMValueRef; BB: LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
  function LLVMBuildCatchPad(Builder: LLVMBuilderRef; ParentPad: LLVMValueRef; Args: PLLVMValueRef; NumArgs: dword; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildCleanupPad(Builder: LLVMBuilderRef; ParentPad: LLVMValueRef; Args: PLLVMValueRef; NumArgs: dword; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildCatchSwitch(Builder: LLVMBuilderRef; ParentPad: LLVMValueRef; UnwindBB: LLVMBasicBlockRef; NumHandlers: dword; Name: Pchar):LLVMValueRef; LibLLVM;
  procedure LLVMAddCase(Switch: LLVMValueRef; OnVal: LLVMValueRef; Dest: LLVMBasicBlockRef); LibLLVM;
  procedure LLVMAddDestination(IndirectBr: LLVMValueRef; Dest: LLVMBasicBlockRef); LibLLVM;
  function LLVMGetNumClauses(LandingPad: LLVMValueRef):dword; LibLLVM;
  function LLVMGetClause(LandingPad: LLVMValueRef; Idx: dword):LLVMValueRef; LibLLVM;
  procedure LLVMAddClause(LandingPad: LLVMValueRef; ClauseVal: LLVMValueRef); LibLLVM;
  function LLVMIsCleanup(LandingPad: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetCleanup(LandingPad: LLVMValueRef; Val: LLVMBool); LibLLVM;
  procedure LLVMAddHandler(CatchSwitch: LLVMValueRef; Dest: LLVMBasicBlockRef); LibLLVM;
  function LLVMGetNumHandlers(CatchSwitch: LLVMValueRef):dword; LibLLVM;
  procedure LLVMGetHandlers(CatchSwitch: LLVMValueRef; Handlers: PLLVMBasicBlockRef); LibLLVM;
  function LLVMGetArgOperand(Funclet: LLVMValueRef; i: dword):LLVMValueRef; LibLLVM;
  procedure LLVMSetArgOperand(Funclet: LLVMValueRef; i: dword; value: LLVMValueRef); LibLLVM;
  function LLVMGetParentCatchSwitch(CatchPad: LLVMValueRef):LLVMValueRef; LibLLVM;
  procedure LLVMSetParentCatchSwitch(CatchPad: LLVMValueRef; CatchSwitch: LLVMValueRef); LibLLVM;
  function LLVMBuildAdd(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNSWAdd(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNUWAdd(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFAdd(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildSub(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNSWSub(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNUWSub(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFSub(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildMul(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNSWMul(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNUWMul(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFMul(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildUDiv(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildExactUDiv(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildSDiv(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildExactSDiv(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFDiv(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildURem(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildSRem(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFRem(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildShl(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildLShr(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildAShr(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildAnd(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildOr(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildXor(Builder: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildBinOp(Builder: LLVMBuilderRef; Op: LLVMOpcode; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNeg(Builder: LLVMBuilderRef; V: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNSWNeg(Builder: LLVMBuilderRef; V: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNUWNeg(Builder: LLVMBuilderRef; V: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFNeg(Builder: LLVMBuilderRef; V: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildNot(Builder: LLVMBuilderRef; V: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildMalloc(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildArrayMalloc(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Val: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildMemSet(Builder: LLVMBuilderRef; Ptr: LLVMValueRef; Val: LLVMValueRef; Len: LLVMValueRef; Align: dword):LLVMValueRef; LibLLVM;
  function LLVMBuildMemCpy(Builder: LLVMBuilderRef; Dst: LLVMValueRef; DstAlign: dword; Src: LLVMValueRef; SrcAlign: dword; 
             Size: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMBuildMemMove(Builder: LLVMBuilderRef; Dst: LLVMValueRef; DstAlign: dword; Src: LLVMValueRef; SrcAlign: dword; 
             Size: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMBuildAlloca(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildArrayAlloca(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Val: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFree(Builder: LLVMBuilderRef; PointerVal: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMBuildLoad2(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; PointerVal: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildStore(Builder: LLVMBuilderRef; Val: LLVMValueRef; Ptr: LLVMValueRef):LLVMValueRef; LibLLVM;
  function LLVMBuildGEP2(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Pointer: LLVMValueRef; Indices: PLLVMValueRef; NumIndices: dword; 
             Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildInBoundsGEP2(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Pointer: LLVMValueRef; Indices: PLLVMValueRef; NumIndices: dword; 
             Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildStructGEP2(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Pointer: LLVMValueRef; Idx: dword; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildGlobalString(Builder: LLVMBuilderRef; Str: Pchar; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildGlobalStringPtr(Builder: LLVMBuilderRef; Str: Pchar; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMGetVolatile(MemoryAccessInst: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetVolatile(MemoryAccessInst: LLVMValueRef; IsVolatile: LLVMBool); LibLLVM;
  function LLVMGetWeak(CmpXchgInst: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetWeak(CmpXchgInst: LLVMValueRef; IsWeak: LLVMBool); LibLLVM;
  function LLVMGetOrdering(MemoryAccessInst: LLVMValueRef):LLVMAtomicOrdering; LibLLVM;
  procedure LLVMSetOrdering(MemoryAccessInst: LLVMValueRef; Ordering: LLVMAtomicOrdering); LibLLVM;
  function LLVMGetAtomicRMWBinOp(AtomicRMWInst: LLVMValueRef):LLVMAtomicRMWBinOp; LibLLVM;
  procedure LLVMSetAtomicRMWBinOp(AtomicRMWInst: LLVMValueRef; BinOp: LLVMAtomicRMWBinOp); LibLLVM;
  function LLVMBuildTrunc(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildZExt(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildSExt(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFPToUI(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFPToSI(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildUIToFP(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildSIToFP(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFPTrunc(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFPExt(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildPtrToInt(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildIntToPtr(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildBitCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildAddrSpaceCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildZExtOrBitCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildSExtOrBitCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildTruncOrBitCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildCast(Builder: LLVMBuilderRef; Op: LLVMOpcode; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildPointerCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildIntCast2(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; IsSigned: LLVMBool; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFPCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildIntCast(Builder: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMGetCastOpcode(Src: LLVMValueRef; SrcIsSigned: LLVMBool; DestTy: LLVMTypeRef; DestIsSigned: LLVMBool):LLVMOpcode; LibLLVM;
  function LLVMBuildICmp(Builder: LLVMBuilderRef; Op: LLVMIntPredicate; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFCmp(Builder: LLVMBuilderRef; Op: LLVMRealPredicate; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildPhi(Builder: LLVMBuilderRef; Ty: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildCall2(Builder: LLVMBuilderRef; _para2: LLVMTypeRef; Fn: LLVMValueRef; Args: PLLVMValueRef; NumArgs: dword; 
             Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildSelect(Builder: LLVMBuilderRef; &If: LLVMValueRef; &Then: LLVMValueRef; &Else: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildVAArg(Builder: LLVMBuilderRef; List: LLVMValueRef; Ty: LLVMTypeRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildExtractElement(Builder: LLVMBuilderRef; VecVal: LLVMValueRef; Index: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildInsertElement(Builder: LLVMBuilderRef; VecVal: LLVMValueRef; EltVal: LLVMValueRef; Index: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildShuffleVector(Builder: LLVMBuilderRef; V1: LLVMValueRef; V2: LLVMValueRef; Mask: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildExtractValue(Builder: LLVMBuilderRef; AggVal: LLVMValueRef; Index: dword; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildInsertValue(Builder: LLVMBuilderRef; AggVal: LLVMValueRef; EltVal: LLVMValueRef; Index: dword; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFreeze(Builder: LLVMBuilderRef; Val: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildIsNull(Builder: LLVMBuilderRef; Val: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildIsNotNull(Builder: LLVMBuilderRef; Val: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildPtrDiff2(Builder: LLVMBuilderRef; ElemTy: LLVMTypeRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildFence(Builder: LLVMBuilderRef; ordering: LLVMAtomicOrdering; singleThread: LLVMBool; Name: Pchar):LLVMValueRef; LibLLVM;
  function LLVMBuildAtomicRMW(Builder: LLVMBuilderRef; op: LLVMAtomicRMWBinOp; PTR: LLVMValueRef; Val: LLVMValueRef; ordering: LLVMAtomicOrdering; 
             singleThread: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMBuildAtomicCmpXchg(Builder: LLVMBuilderRef; Ptr: LLVMValueRef; Cmp: LLVMValueRef; _New: LLVMValueRef; SuccessOrdering: LLVMAtomicOrdering; 
             FailureOrdering: LLVMAtomicOrdering; SingleThread: LLVMBool):LLVMValueRef; LibLLVM;
  function LLVMGetNumMaskElements(ShuffleVectorInst: LLVMValueRef):dword; LibLLVM;
  function LLVMGetUndefMaskElem: longint; LibLLVM;
  function LLVMGetMaskValue(ShuffleVectorInst: LLVMValueRef; Elt: dword):longint; LibLLVM;
  function LLVMIsAtomicSingleThread(AtomicInst: LLVMValueRef):LLVMBool; LibLLVM;
  procedure LLVMSetAtomicSingleThread(AtomicInst: LLVMValueRef; SingleThread: LLVMBool); LibLLVM;
  function LLVMGetCmpXchgSuccessOrdering(CmpXchgInst: LLVMValueRef):LLVMAtomicOrdering; LibLLVM;
  procedure LLVMSetCmpXchgSuccessOrdering(CmpXchgInst: LLVMValueRef; Ordering: LLVMAtomicOrdering); LibLLVM;
  function LLVMGetCmpXchgFailureOrdering(CmpXchgInst: LLVMValueRef):LLVMAtomicOrdering; LibLLVM;
  procedure LLVMSetCmpXchgFailureOrdering(CmpXchgInst: LLVMValueRef; Ordering: LLVMAtomicOrdering); LibLLVM;
  function LLVMCreateModuleProviderForExistingModule(M: LLVMModuleRef):LLVMModuleProviderRef; LibLLVM;
  procedure LLVMDisposeModuleProvider(M: LLVMModuleProviderRef); LibLLVM;
  function LLVMCreateMemoryBufferWithContentsOfFile(Path: Pchar; OutMemBuf: PLLVMMemoryBufferRef; OutMessage: PPchar):LLVMBool; LibLLVM;
  function LLVMCreateMemoryBufferWithSTDIN(OutMemBuf: PLLVMMemoryBufferRef; OutMessage: PPchar):LLVMBool; LibLLVM;
  function LLVMCreateMemoryBufferWithMemoryRange(InputData: Pchar; InputDataLength: size_t; BufferName: Pchar; RequiresNullTerminator: LLVMBool):LLVMMemoryBufferRef; LibLLVM;
  function LLVMCreateMemoryBufferWithMemoryRangeCopy(InputData: Pchar; InputDataLength: size_t; BufferName: Pchar):LLVMMemoryBufferRef; LibLLVM;
  function LLVMGetBufferStart(MemBuf: LLVMMemoryBufferRef):PChar; LibLLVM;
  function LLVMGetBufferSize(MemBuf: LLVMMemoryBufferRef):size_t; LibLLVM;
  procedure LLVMDisposeMemoryBuffer(MemBuf: LLVMMemoryBufferRef); LibLLVM;
  function LLVMGetGlobalPassRegistry: LLVMPassRegistryRef; LibLLVM;
  function LLVMCreatePassManager: LLVMPassManagerRef; LibLLVM;
  function LLVMCreateFunctionPassManagerForModule(M: LLVMModuleRef):LLVMPassManagerRef; LibLLVM;
  function LLVMCreateFunctionPassManager(MP: LLVMModuleProviderRef):LLVMPassManagerRef; LibLLVM;
  function LLVMRunPassManager(PM: LLVMPassManagerRef; M: LLVMModuleRef):LLVMBool; LibLLVM;
  function LLVMInitializeFunctionPassManager(FPM: LLVMPassManagerRef):LLVMBool; LibLLVM;
  function LLVMRunFunctionPassManager(FPM: LLVMPassManagerRef; F: LLVMValueRef):LLVMBool; LibLLVM;
  function LLVMFinalizeFunctionPassManager(FPM: LLVMPassManagerRef):LLVMBool; LibLLVM;
  procedure LLVMDisposePassManager(PM: LLVMPassManagerRef); LibLLVM;
  function LLVMStartMultithreaded: LLVMBool; LibLLVM;
  procedure LLVMStopMultithreaded; LibLLVM;
  function LLVMIsMultithreaded: LLVMBool; LibLLVM;

implementation
end.
