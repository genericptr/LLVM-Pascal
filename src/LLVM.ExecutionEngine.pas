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

unit LLVM.ExecutionEngine;
interface
uses
  LLVM.Types, LLVM.TargetMachine, LLVM.Target;
  
{$include LLVM.Macros.inc}

type
  Pchar  = ^char;
  Puint8_t  = ^UInt8;

type
  PLLVMExecutionEngineRef  = ^LLVMExecutionEngineRef;
  PLLVMGenericValueRef  = ^LLVMGenericValueRef;
  PLLVMMCJITCompilerOptions  = ^LLVMMCJITCompilerOptions;
  PLLVMModuleRef  = ^LLVMModuleRef;
  PLLVMValueRef  = ^LLVMValueRef;

  LLVMOpaqueGenericValue = record end;
  LLVMOpaqueExecutionEngine = record end;
  LLVMOpaqueMCJITMemoryManager = record end;

  LLVMGenericValueRef = ^LLVMOpaqueGenericValue;
  LLVMExecutionEngineRef = ^LLVMOpaqueExecutionEngine;
  LLVMMCJITMemoryManagerRef = ^LLVMOpaqueMCJITMemoryManager;
  LLVMMCJITCompilerOptions = record
    OptLevel : dword;
    CodeModel : LLVMCodeModel;
    NoFramePointerElim : LLVMBool;
    EnableFastISel : LLVMBool;
    MCJMM : LLVMMCJITMemoryManagerRef;
  end;

type
  LLVMMemoryManagerAllocateCodeSectionCallback = function (Opaque:pointer; Size:PtrUInt; Alignment:dword; SectionID:dword; SectionName:Pchar):Puint8_t;cdecl;
  LLVMMemoryManagerAllocateDataSectionCallback = function (Opaque:pointer; Size:PtrUInt; Alignment:dword; SectionID:dword; SectionName:Pchar; IsReadOnly:LLVMBool):Puint8_t;cdecl;
  LLVMMemoryManagerFinalizeMemoryCallback = function (Opaque:pointer; ErrMsg:PPchar):LLVMBool;cdecl;
  LLVMMemoryManagerDestroyCallback = procedure (Opaque:pointer);cdecl;

procedure LLVMLinkInMCJIT; LibLLVM;
procedure LLVMLinkInInterpreter; LibLLVM;
function LLVMCreateGenericValueOfInt(Ty:LLVMTypeRef; N:qword; IsSigned:LLVMBool):LLVMGenericValueRef; LibLLVM;
function LLVMCreateGenericValueOfPointer(P:pointer):LLVMGenericValueRef; LibLLVM;
function LLVMCreateGenericValueOfFloat(Ty:LLVMTypeRef; N:double):LLVMGenericValueRef; LibLLVM;
function LLVMGenericValueIntWidth(GenValRef:LLVMGenericValueRef):dword; LibLLVM;
function LLVMGenericValueToInt(GenVal:LLVMGenericValueRef; IsSigned:LLVMBool):qword; LibLLVM;
function LLVMGenericValueToPointer(GenVal:LLVMGenericValueRef):pointer; LibLLVM;
function LLVMGenericValueToFloat(TyRef:LLVMTypeRef; GenVal:LLVMGenericValueRef):double; LibLLVM;
procedure LLVMDisposeGenericValue(GenVal:LLVMGenericValueRef); LibLLVM;
function LLVMCreateExecutionEngineForModule(OutEE:PLLVMExecutionEngineRef; M:LLVMModuleRef; OutError:PPchar):LLVMBool; LibLLVM;
function LLVMCreateInterpreterForModule(OutInterp:PLLVMExecutionEngineRef; M:LLVMModuleRef; OutError:PPchar):LLVMBool; LibLLVM;
function LLVMCreateJITCompilerForModule(OutJIT:PLLVMExecutionEngineRef; M:LLVMModuleRef; OptLevel:dword; OutError:PPchar):LLVMBool; LibLLVM;
procedure LLVMInitializeMCJITCompilerOptions(Options:PLLVMMCJITCompilerOptions; SizeOfOptions:Integer); LibLLVM;
function LLVMCreateMCJITCompilerForModule(OutJIT:PLLVMExecutionEngineRef; M:LLVMModuleRef; Options:PLLVMMCJITCompilerOptions; SizeOfOptions:Integer; OutError:PPchar):LLVMBool; LibLLVM;
procedure LLVMDisposeExecutionEngine(EE:LLVMExecutionEngineRef); LibLLVM;
procedure LLVMRunStaticConstructors(EE:LLVMExecutionEngineRef); LibLLVM;
procedure LLVMRunStaticDestructors(EE:LLVMExecutionEngineRef); LibLLVM;
function LLVMRunFunctionAsMain(EE:LLVMExecutionEngineRef; F:LLVMValueRef; ArgC:dword; ArgV:PPchar; EnvP:PPchar):longint; LibLLVM;
function LLVMRunFunction(EE:LLVMExecutionEngineRef; F:LLVMValueRef; NumArgs:dword; Args:PLLVMGenericValueRef):LLVMGenericValueRef; LibLLVM;
procedure LLVMFreeMachineCodeForFunction(EE:LLVMExecutionEngineRef; F:LLVMValueRef); LibLLVM;
procedure LLVMAddModule(EE:LLVMExecutionEngineRef; M:LLVMModuleRef); LibLLVM;
function LLVMRemoveModule(EE:LLVMExecutionEngineRef; M:LLVMModuleRef; OutMod:PLLVMModuleRef; OutError:PPchar):LLVMBool; LibLLVM;
function LLVMFindFunction(EE:LLVMExecutionEngineRef; Name:Pchar; OutFn:PLLVMValueRef):LLVMBool; LibLLVM;
function LLVMRecompileAndRelinkFunction(EE:LLVMExecutionEngineRef; Fn:LLVMValueRef):pointer; LibLLVM;
function LLVMGetExecutionEngineTargetData(EE:LLVMExecutionEngineRef):LLVMTargetDataRef; LibLLVM;
function LLVMGetExecutionEngineTargetMachine(EE:LLVMExecutionEngineRef):LLVMTargetMachineRef; LibLLVM;
procedure LLVMAddGlobalMapping(EE:LLVMExecutionEngineRef; Global:LLVMValueRef; Addr:pointer); LibLLVM;
function LLVMGetPointerToGlobal(EE:LLVMExecutionEngineRef; Global:LLVMValueRef):pointer; LibLLVM;
function LLVMGetGlobalValueAddress(EE:LLVMExecutionEngineRef; Name:Pchar):UInt64; LibLLVM;
function LLVMGetFunctionAddress(EE:LLVMExecutionEngineRef; Name:Pchar):UInt64; LibLLVM;
function LLVMExecutionEngineGetErrMsg(EE:LLVMExecutionEngineRef; OutError:PPchar):LLVMBool; LibLLVM;
function LLVMCreateSimpleMCJITMemoryManager(Opaque:pointer; AllocateCodeSection:LLVMMemoryManagerAllocateCodeSectionCallback; AllocateDataSection:LLVMMemoryManagerAllocateDataSectionCallback; FinalizeMemory:LLVMMemoryManagerFinalizeMemoryCallback; Destroy:LLVMMemoryManagerDestroyCallback):LLVMMCJITMemoryManagerRef; LibLLVM;
procedure LLVMDisposeMCJITMemoryManager(MM:LLVMMCJITMemoryManagerRef); LibLLVM;
function LLVMCreateGDBRegistrationListener:LLVMJITEventListenerRef; LibLLVM;
function LLVMCreateIntelJITEventListener:LLVMJITEventListenerRef; LibLLVM;
function LLVMCreateOProfileJITEventListener:LLVMJITEventListenerRef; LibLLVM;
function LLVMCreatePerfJITEventListener:LLVMJITEventListenerRef; LibLLVM;

implementation

end.
