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

unit LLVM.ObjectFile;
interface
uses
  UnixType;
  
{$include LLVM.Macros.inc}
{$include LLVM.Types.inc}

type
  LLVMSectionIteratorRef = type LLVMOpaqueType;
  LLVMSymbolIteratorRef = type LLVMOpaqueType;
  LLVMRelocationIteratorRef = type LLVMOpaqueType;
  LLVMObjectFileRef = type LLVMOpaqueType;

  LLVMBinaryType = (LLVMBinaryTypeArchive,LLVMBinaryTypeMachOUniversalBinary,
    LLVMBinaryTypeCOFFImportFile,LLVMBinaryTypeIR,
    LLVMBinaryTypeWinRes,LLVMBinaryTypeCOFF,
    LLVMBinaryTypeELF32L,LLVMBinaryTypeELF32B,
    LLVMBinaryTypeELF64L,LLVMBinaryTypeELF64B,
    LLVMBinaryTypeMachO32L,LLVMBinaryTypeMachO32B,
    LLVMBinaryTypeMachO64L,LLVMBinaryTypeMachO64B,
    LLVMBinaryTypeWasm,LLVMBinaryTypeOffload
    );

function LLVMCreateBinary(MemBuf:LLVMMemoryBufferRef; Context:LLVMContextRef; ErrorMessage:PPchar):LLVMBinaryRef; LibLLVM;
procedure LLVMDisposeBinary(BR:LLVMBinaryRef); LibLLVM;
function LLVMBinaryCopyMemoryBuffer(BR:LLVMBinaryRef):LLVMMemoryBufferRef; LibLLVM;
function LLVMBinaryGetType(BR:LLVMBinaryRef):LLVMBinaryType; LibLLVM;
function LLVMMachOUniversalBinaryCopyObjectForArch(BR:LLVMBinaryRef; Arch:Pchar; ArchLen:size_t; ErrorMessage:PPchar):LLVMBinaryRef; LibLLVM;
function LLVMObjectFileCopySectionIterator(BR:LLVMBinaryRef):LLVMSectionIteratorRef; LibLLVM;
function LLVMObjectFileIsSectionIteratorAtEnd(BR:LLVMBinaryRef; SI:LLVMSectionIteratorRef):LLVMBool; LibLLVM;
function LLVMObjectFileCopySymbolIterator(BR:LLVMBinaryRef):LLVMSymbolIteratorRef; LibLLVM;
function LLVMObjectFileIsSymbolIteratorAtEnd(BR:LLVMBinaryRef; SI:LLVMSymbolIteratorRef):LLVMBool; LibLLVM;
procedure LLVMDisposeSectionIterator(SI:LLVMSectionIteratorRef); LibLLVM;
procedure LLVMMoveToNextSection(SI:LLVMSectionIteratorRef); LibLLVM;
procedure LLVMMoveToContainingSection(Sect:LLVMSectionIteratorRef; Sym:LLVMSymbolIteratorRef); LibLLVM;
procedure LLVMDisposeSymbolIterator(SI:LLVMSymbolIteratorRef); LibLLVM;
procedure LLVMMoveToNextSymbol(SI:LLVMSymbolIteratorRef); LibLLVM;
function LLVMGetSectionName(SI:LLVMSectionIteratorRef):pchar; LibLLVM;
function LLVMGetSectionSize(SI:LLVMSectionIteratorRef):UInt64; LibLLVM;
function LLVMGetSectionContents(SI:LLVMSectionIteratorRef):pchar; LibLLVM;
function LLVMGetSectionAddress(SI:LLVMSectionIteratorRef):UInt64; LibLLVM;
function LLVMGetSectionContainsSymbol(SI:LLVMSectionIteratorRef; Sym:LLVMSymbolIteratorRef):LLVMBool; LibLLVM;
function LLVMGetRelocations(Section:LLVMSectionIteratorRef):LLVMRelocationIteratorRef; LibLLVM;
procedure LLVMDisposeRelocationIterator(RI:LLVMRelocationIteratorRef); LibLLVM;
function LLVMIsRelocationIteratorAtEnd(Section:LLVMSectionIteratorRef; RI:LLVMRelocationIteratorRef):LLVMBool; LibLLVM;
procedure LLVMMoveToNextRelocation(RI:LLVMRelocationIteratorRef); LibLLVM;
function LLVMGetSymbolName(SI:LLVMSymbolIteratorRef):pchar; LibLLVM;
function LLVMGetSymbolAddress(SI:LLVMSymbolIteratorRef):UInt64; LibLLVM;
function LLVMGetSymbolSize(SI:LLVMSymbolIteratorRef):UInt64; LibLLVM;
function LLVMGetRelocationOffset(RI:LLVMRelocationIteratorRef):UInt64; LibLLVM;
function LLVMGetRelocationSymbol(RI:LLVMRelocationIteratorRef):LLVMSymbolIteratorRef; LibLLVM;
function LLVMGetRelocationType(RI:LLVMRelocationIteratorRef):UInt64; LibLLVM;
function LLVMGetRelocationTypeName(RI:LLVMRelocationIteratorRef):pchar; LibLLVM;
function LLVMGetRelocationValueString(RI:LLVMRelocationIteratorRef):pchar; LibLLVM;
function LLVMCreateObjectFile(MemBuf:LLVMMemoryBufferRef):LLVMObjectFileRef; LibLLVM;
procedure LLVMDisposeObjectFile(ObjectFile:LLVMObjectFileRef); LibLLVM;
function LLVMGetSections(ObjectFile:LLVMObjectFileRef):LLVMSectionIteratorRef; LibLLVM;
function LLVMIsSectionIteratorAtEnd(ObjectFile:LLVMObjectFileRef; SI:LLVMSectionIteratorRef):LLVMBool; LibLLVM;
function LLVMGetSymbols(ObjectFile:LLVMObjectFileRef):LLVMSymbolIteratorRef; LibLLVM;
function LLVMIsSymbolIteratorAtEnd(ObjectFile:LLVMObjectFileRef; SI:LLVMSymbolIteratorRef):LLVMBool; LibLLVM;

implementation


end.
