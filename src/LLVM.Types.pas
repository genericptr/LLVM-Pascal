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

unit LLVM.Types;
interface

const
  LLVMErrorSuccess = 0;

type
  LLVMBool = boolean;

type
  LLVMMemoryBufferRef = class end;
  LLVMContextRef = class end;
  LLVMModuleRef = class end;
  LLVMTypeRef = class end;
  LLVMValueRef = class end;
  LLVMBasicBlockRef = class(LLVMValueRef);
  LLVMMetadataRef = class end;
  LLVMNamedMDNodeRef = class end;
  LLVMValueMetadataEntry = class end;
  LLVMBuilderRef = class end;
  LLVMDIBuilderRef = class end;
  LLVMModuleProviderRef = class end;
  LLVMPassManagerRef = class end;
  LLVMPassRegistryRef = class end;
  LLVMUseRef = class end;
  LLVMAttributeRef = class end;
  LLVMDiagnosticInfoRef = class end;
  LLVMComdatRef = class end;
  LLVMModuleFlagEntry = class end;
  LLVMJITEventListenerRef = class end;
  LLVMBinaryRef = class end;
  LLVMErrorRef = class end;
  LLVMErrorTypeId = class end;

type
  PLLVMAttributeRef = ^LLVMAttributeRef;
  PLLVMBasicBlockRef = ^LLVMBasicBlockRef;
  PLLVMBool = ^LLVMBool;
  PLLVMMemoryBufferRef = ^LLVMMemoryBufferRef;
  PLLVMMetadataRef = ^LLVMMetadataRef;
  PLLVMModuleFlagEntry = ^LLVMModuleFlagEntry;
  PLLVMTypeRef = ^LLVMTypeRef;
  PLLVMValueMetadataEntry  = ^LLVMValueMetadataEntry;
  PLLVMValueRef = ^LLVMValueRef;
  PLLVMModuleRef = ^LLVMModuleRef;

type
  PUInt64  = ^UInt64;

implementation

end.