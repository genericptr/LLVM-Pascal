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

unit LLVM.BitReader;
interface

{$include LLVM.Macros.inc}
{$include LLVM.Types.inc}

function LLVMParseBitcode(MemBuf:LLVMMemoryBufferRef; OutModule:PLLVMModuleRef; OutMessage:PPchar):LLVMBool; LibLLVM;
function LLVMParseBitcode2(MemBuf:LLVMMemoryBufferRef; OutModule:PLLVMModuleRef):LLVMBool; LibLLVM;
function LLVMParseBitcodeInContext(ContextRef:LLVMContextRef; MemBuf:LLVMMemoryBufferRef; OutModule:PLLVMModuleRef; OutMessage:PPchar):LLVMBool; LibLLVM;
function LLVMParseBitcodeInContext2(ContextRef:LLVMContextRef; MemBuf:LLVMMemoryBufferRef; OutModule:PLLVMModuleRef):LLVMBool; LibLLVM;
function LLVMGetBitcodeModuleInContext(ContextRef:LLVMContextRef; MemBuf:LLVMMemoryBufferRef; OutM:PLLVMModuleRef; OutMessage:PPchar):LLVMBool; LibLLVM;
function LLVMGetBitcodeModuleInContext2(ContextRef:LLVMContextRef; MemBuf:LLVMMemoryBufferRef; OutM:PLLVMModuleRef):LLVMBool; LibLLVM;
function LLVMGetBitcodeModule(MemBuf:LLVMMemoryBufferRef; OutM:PLLVMModuleRef; OutMessage:PPchar):LLVMBool; LibLLVM;
function LLVMGetBitcodeModule2(MemBuf:LLVMMemoryBufferRef; OutM:PLLVMModuleRef):LLVMBool; LibLLVM;

implementation


end.
