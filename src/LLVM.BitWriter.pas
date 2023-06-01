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

unit LLVM.BitWriter;
interface
uses
  LLVM.Types;

{$include LLVM.Macros.inc}

function LLVMWriteBitcodeToFile(M:LLVMModuleRef; Path:Pchar):longint; LibLLVM;
function LLVMWriteBitcodeToFD(M:LLVMModuleRef; FD:longint; ShouldClose:longint; Unbuffered:longint):longint; LibLLVM;
function LLVMWriteBitcodeToFileHandle(M:LLVMModuleRef; Handle:longint):longint; LibLLVM;
function LLVMWriteBitcodeToMemoryBuffer(M:LLVMModuleRef):LLVMMemoryBufferRef; LibLLVM;

implementation

end.
