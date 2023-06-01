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

type
  LLVMBool = boolean;

type
  LLVMMemoryBufferOpaqueType = record end;
  LLVMContextOpaqueType = record end;
  LLVMModuleOpaqueType = record end;
  LLVMTypeOpaqueType = record end;
  LLVMValueOpaqueType = record end;
  LLVMBasicBlockOpaqueType = record end;
  LLVMMetadataOpaqueType = record end;
  LLVMNamedMDNodeOpaqueType = record end;
  LLVMValueMetadataEnOpaqueType = record end;
  LLVMBuilderOpaqueType = record end;
  LLVMDIBuilderOpaqueType = record end;
  LLVMModuleProviderOpaqueType = record end;
  LLVMPassManagerOpaqueType = record end;
  LLVMPassRegistryOpaqueType = record end;
  LLVMUseOpaqueType = record end;
  LLVMAttributeOpaqueType = record end;
  LLVMDiagnosticInfoOpaqueType = record end;
  LLVMComdatOpaqueType = record end;
  LLVMModuleFlagEnOpaqueType = record end;
  LLVMJITEventListenerOpaqueType = record end;
  LLVMBinaryOpaqueType = record end;

  LLVMMemoryBufferRef = ^LLVMMemoryBufferOpaqueType;
  LLVMContextRef = ^LLVMContextOpaqueType;
  LLVMModuleRef = ^LLVMModuleOpaqueType;
  LLVMTypeRef = ^LLVMTypeOpaqueType;
  LLVMValueRef = ^LLVMValueOpaqueType;
  LLVMBasicBlockRef = ^LLVMBasicBlockOpaqueType;
  LLVMMetadataRef = ^LLVMMetadataOpaqueType;
  LLVMNamedMDNodeRef = ^LLVMNamedMDNodeOpaqueType;
  LLVMValueMetadataEntry = ^LLVMValueMetadataEnOpaqueType;
  LLVMBuilderRef = ^LLVMBuilderOpaqueType;
  LLVMDIBuilderRef = ^LLVMDIBuilderOpaqueType;
  LLVMModuleProviderRef = ^LLVMModuleProviderOpaqueType;
  LLVMPassManagerRef = ^LLVMPassManagerOpaqueType;
  LLVMPassRegistryRef = ^LLVMPassRegistryOpaqueType;
  LLVMUseRef = ^LLVMUseOpaqueType;
  LLVMAttributeRef = ^LLVMAttributeOpaqueType;
  LLVMDiagnosticInfoRef = ^LLVMDiagnosticInfoOpaqueType;
  LLVMComdatRef = ^LLVMComdatOpaqueType;
  LLVMModuleFlagEntry = ^LLVMModuleFlagEnOpaqueType;
  LLVMJITEventListenerRef = ^LLVMJITEventListenerOpaqueType;
  LLVMBinaryRef = ^LLVMBinaryOpaqueType;

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