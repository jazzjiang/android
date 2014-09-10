<#ftl>
<#--
        Copyright 2013 The Android Open Source Project

        Licensed under the Apache License, Version 2.0 (the "License");
        you may not use this file except in compliance with the License.
        You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

        Unless required by applicable law or agreed to in writing, software
        distributed under the License is distributed on an "AS IS" BASIS,
        WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        See the License for the specific language governing permissions and
        limitations under the License.
-->
<#-- Add the appropriate copyright header -->
<#if meta.outputFile?ends_with("java")>
    <#include "c-style-copyright.ftl">
<#elseif meta.outputFile?ends_with("xml")>
    <#include "xml-style-copyright.ftl">
</#if>
<#-- Set the compile SDK version. This is more complicated than it should be, because
      the version can be either a number or a string (e.g. KeyLimePie) so we need to test
      both to see if the variable is empty.  Note that to freemarker, all values from
      template-params.xml are Strings, even those that are human-readable as ints.

      Also, there's no way to check if it's a number or not without spamming output with try/catch
      stacktraces, so we can't silently wrap a string in quotes and leave a number alone.
-->
<#if (samples.compileSdkVersion)?? && (sample.compileSdkVersion)?is_string>
    <#if (sample.compileSdkVersion?contains("android")) && !(sample.compileSdkVersion?starts_with("\""))
            && !(sample.compileSdkVersion?ends_with("\""))>
        <#assign compile_sdk = "\"${sample.compileSdkVersion}\""/>
    <#else>
        <#assign compile_sdk = sample.compileSdkVersion/>
    </#if>
<#elseif (sample.compileSdkVersion)?has_content>
    <#assign compile_sdk = sample.compileSdkVersion/>
<#else>
    <#assign compile_sdk = "\"android-L\""/>
</#if>
<#-- Set the global build tools version -->
<#assign build_tools_version='"20"'/>
