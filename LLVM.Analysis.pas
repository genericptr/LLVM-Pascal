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

unit LLVM.Analysis;
interface

{$include LLVM.Macros.inc}
{$include LLVM.Types.inc}

type
  LLVMVerifierFailureAction = (
    LLVMAbortProcessAction,
    LLVMPrintMessageAction,
    LLVMReturnStatusAction
  );

function LLVMVerifyModule(M: LLVMModuleRef; Action: LLVMVerifierFailureAction; OutMessage: PPchar):LLVMBool; LibLLVM;
function LLVMVerifyFunction(Fn: LLVMValueRef; Action: LLVMVerifierFailureAction):LLVMBool; LibLLVM;
procedure LLVMViewFunctionCFG(Fn: LLVMValueRef); LibLLVM;
procedure LLVMViewFunctionCFGOnly(Fn: LLVMValueRef); LibLLVM;

implementation

end.
