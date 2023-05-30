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

unit LLVM.Init;
interface

{$include LLVM.Macros.inc}
{$include LLVM.Types.inc}

procedure LLVMInitializeCore(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeTransformUtils(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeScalarOpts(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeVectorization(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeInstCombine(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeIPO(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeAnalysis(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeIPA(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeCodeGen(R:LLVMPassRegistryRef); LibLLVM;
procedure LLVMInitializeTarget(R:LLVMPassRegistryRef); LibLLVM;

implementation


end.
