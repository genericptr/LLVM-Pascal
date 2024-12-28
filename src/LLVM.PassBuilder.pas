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

unit LLVM.PassBuilder;
interface
uses
  LLVM.Types, LLVM.TargetMachine;

{$include LLVM.Macros.inc}

type
  LLVMOpaquePassBuilderOptions = record end;
  LLVMPassBuilderOptionsRef = ^LLVMOpaquePassBuilderOptions;

function LLVMRunPasses(M: LLVMModuleRef; Passes: Pchar; TM: LLVMTargetMachineRef; Options: LLVMPassBuilderOptionsRef): LLVMErrorRef; LibLLVM;
function LLVMCreatePassBuilderOptions: LLVMPassBuilderOptionsRef; LibLLVM;
procedure LLVMPassBuilderOptionsSetVerifyEach(Options: LLVMPassBuilderOptionsRef; VerifyEach: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetDebugLogging(Options: LLVMPassBuilderOptionsRef; DebugLogging: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetLoopInterleaving(Options: LLVMPassBuilderOptionsRef; LoopInterleaving: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetLoopVectorization(Options: LLVMPassBuilderOptionsRef; LoopVectorization: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetSLPVectorization(Options: LLVMPassBuilderOptionsRef; SLPVectorization: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetLoopUnrolling(Options: LLVMPassBuilderOptionsRef; LoopUnrolling: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll(Options: LLVMPassBuilderOptionsRef; ForgetAllSCEVInLoopUnroll: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetLicmMssaOptCap(Options: LLVMPassBuilderOptionsRef; LicmMssaOptCap: dword); LibLLVM;
procedure LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap(Options: LLVMPassBuilderOptionsRef; LicmMssaNoAccForPromotionCap: dword); LibLLVM;
procedure LLVMPassBuilderOptionsSetCallGraphProfile(Options: LLVMPassBuilderOptionsRef; CallGraphProfile: LLVMBool); LibLLVM;
procedure LLVMPassBuilderOptionsSetMergeFunctions(Options: LLVMPassBuilderOptionsRef; MergeFunctions: LLVMBool); LibLLVM;
procedure LLVMDisposePassBuilderOptions(Options: LLVMPassBuilderOptionsRef); LibLLVM;

implementation

end.
