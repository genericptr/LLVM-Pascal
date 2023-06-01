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

unit LLVM.TargetMachine;
interface
uses
  LLVM.Types, LLVM.Target;
  
{$include LLVM.Macros.inc}

type
  LLVMTargetMachineOpaqueType = record end;
  LLVMTargetOpaqueType = record end;

  LLVMTargetMachineRef = ^LLVMTargetMachineOpaqueType;
  LLVMTargetRef = ^LLVMTargetOpaqueType;

  PLLVMTargetRef = ^LLVMTargetRef;

type
  LLVMCodeGenOptLevel = (LLVMCodeGenLevelNone,LLVMCodeGenLevelLess,
    LLVMCodeGenLevelDefault,LLVMCodeGenLevelAggressive
    );

  LLVMRelocMode = (LLVMRelocDefault,LLVMRelocStatic,LLVMRelocPIC,
    LLVMRelocDynamicNoPic,LLVMRelocROPI,LLVMRelocRWPI,
    LLVMRelocROPI_RWPI);

  LLVMCodeModel = (LLVMCodeModelDefault,LLVMCodeModelJITDefault,
    LLVMCodeModelTiny,LLVMCodeModelSmall,
    LLVMCodeModelKernel,LLVMCodeModelMedium,
    LLVMCodeModelLarge);

  LLVMCodeGenFileType = (LLVMAssemblyFile,LLVMObjectFile);

function LLVMGetFirstTarget(T:LLVMTargetRef):LLVMTargetRef; LibLLVM;
function LLVMGetNextTarget(T:LLVMTargetRef):LLVMTargetRef; LibLLVM;
function LLVMGetTargetFromName(Name:Pchar):LLVMTargetRef; LibLLVM;
function LLVMGetTargetFromTriple(Triple:Pchar; T:PLLVMTargetRef; ErrorMessage:PPchar):LLVMBool; LibLLVM;
function LLVMGetTargetName(T:LLVMTargetRef):pchar; LibLLVM;
function LLVMGetTargetDescription(T:LLVMTargetRef):pchar; LibLLVM;
function LLVMTargetHasJIT(T:LLVMTargetRef):LLVMBool; LibLLVM;
function LLVMTargetHasTargetMachine(T:LLVMTargetRef):LLVMBool; LibLLVM;
function LLVMTargetHasAsmBackend(T:LLVMTargetRef):LLVMBool; LibLLVM;
function LLVMCreateTargetMachine(T:LLVMTargetRef; Triple:Pchar; CPU:Pchar; Features:Pchar; Level:LLVMCodeGenOptLevel; 
           Reloc:LLVMRelocMode; CodeModel:LLVMCodeModel):LLVMTargetMachineRef; LibLLVM;
procedure LLVMDisposeTargetMachine(T:LLVMTargetMachineRef); LibLLVM;
function LLVMGetTargetMachineTarget(T:LLVMTargetMachineRef):LLVMTargetRef; LibLLVM;
function LLVMGetTargetMachineTriple(T:LLVMTargetMachineRef):pchar; LibLLVM;
function LLVMGetTargetMachineCPU(T:LLVMTargetMachineRef):pchar; LibLLVM;
function LLVMGetTargetMachineFeatureString(T:LLVMTargetMachineRef):pchar; LibLLVM;
function LLVMCreateTargetDataLayout(T:LLVMTargetMachineRef):LLVMTargetDataRef; LibLLVM;
procedure LLVMSetTargetMachineAsmVerbosity(T:LLVMTargetMachineRef; VerboseAsm:LLVMBool); LibLLVM;
function LLVMTargetMachineEmitToFile(T:LLVMTargetMachineRef; M:LLVMModuleRef; Filename:Pchar; codegen:LLVMCodeGenFileType; ErrorMessage:PPchar):LLVMBool; LibLLVM;
function LLVMTargetMachineEmitToMemoryBuffer(T:LLVMTargetMachineRef; M:LLVMModuleRef; codegen:LLVMCodeGenFileType; ErrorMessage:PPchar; OutMemBuf:PLLVMMemoryBufferRef):LLVMBool; LibLLVM;
function LLVMGetDefaultTargetTriple:pchar; LibLLVM;
function LLVMNormalizeTargetTriple(triple:Pchar):pchar; LibLLVM;
function LLVMGetHostCPUName:pchar; LibLLVM;
function LLVMGetHostCPUFeatures:pchar; LibLLVM;
procedure LLVMAddAnalysisPasses(T:LLVMTargetMachineRef; PM:LLVMPassManagerRef); LibLLVM;

implementation


end.
