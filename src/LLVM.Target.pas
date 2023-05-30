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

unit LLVM.Target;
interface

// TODO: `LLVM_TARGET` macros are missing and `LLVMInitialize*`

{$include LLVM.Macros.inc}
{$include LLVM.Types.inc}

type
  LLVMByteOrdering = (LLVMBigEndian,LLVMLittleEndian);
  LLVMTargetDataRef = type LLVMOpaqueType;
  LLVMTargetLibraryInfoRef = type LLVMOpaqueType;

function LLVMGetModuleDataLayout(M:LLVMModuleRef):LLVMTargetDataRef; LibLLVM;
procedure LLVMSetModuleDataLayout(M:LLVMModuleRef; DL:LLVMTargetDataRef); LibLLVM;
function LLVMCreateTargetData(StringRep:Pchar):LLVMTargetDataRef; LibLLVM;
procedure LLVMDisposeTargetData(TD:LLVMTargetDataRef); LibLLVM;
procedure LLVMAddTargetLibraryInfo(TLI:LLVMTargetLibraryInfoRef; PM:LLVMPassManagerRef); LibLLVM;
function LLVMCopyStringRepOfTargetData(TD:LLVMTargetDataRef):Pchar; LibLLVM;
function LLVMPointerSize(TD:LLVMTargetDataRef):dword; LibLLVM;
function LLVMPointerSizeForAS(TD:LLVMTargetDataRef; &AS:dword):dword; LibLLVM;
function LLVMIntPtrType(TD:LLVMTargetDataRef):LLVMTypeRef; LibLLVM;
function LLVMIntPtrTypeForAS(TD:LLVMTargetDataRef; &AS:dword):LLVMTypeRef; LibLLVM;
function LLVMIntPtrTypeInContext(C:LLVMContextRef; TD:LLVMTargetDataRef):LLVMTypeRef; LibLLVM;
function LLVMIntPtrTypeForASInContext(C:LLVMContextRef; TD:LLVMTargetDataRef; &AS:dword):LLVMTypeRef; LibLLVM;
function LLVMSizeOfTypeInBits(TD:LLVMTargetDataRef; Ty:LLVMTypeRef):qword; LibLLVM;
function LLVMStoreSizeOfType(TD:LLVMTargetDataRef; Ty:LLVMTypeRef):qword; LibLLVM;
function LLVMABISizeOfType(TD:LLVMTargetDataRef; Ty:LLVMTypeRef):qword; LibLLVM;
function LLVMABIAlignmentOfType(TD:LLVMTargetDataRef; Ty:LLVMTypeRef):dword; LibLLVM;
function LLVMCallFrameAlignmentOfType(TD:LLVMTargetDataRef; Ty:LLVMTypeRef):dword; LibLLVM;
function LLVMPreferredAlignmentOfType(TD:LLVMTargetDataRef; Ty:LLVMTypeRef):dword; LibLLVM;
function LLVMPreferredAlignmentOfGlobal(TD:LLVMTargetDataRef; GlobalVar:LLVMValueRef):dword; LibLLVM;
function LLVMElementAtOffset(TD:LLVMTargetDataRef; StructTy:LLVMTypeRef; Offset:qword):dword; LibLLVM;
function LLVMOffsetOfElement(TD:LLVMTargetDataRef; StructTy:LLVMTypeRef; Element:dword):qword; LibLLVM;

implementation


end.
