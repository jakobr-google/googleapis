library googleapis.servicemanagement.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/servicemanagement/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request
          .finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(core.int status,
    core.Map<core.String, core.String> headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterAdvice = 0;
buildAdvice() {
  var o = new api.Advice();
  buildCounterAdvice++;
  if (buildCounterAdvice < 3) {
    o.description = "foo";
  }
  buildCounterAdvice--;
  return o;
}

checkAdvice(api.Advice o) {
  buildCounterAdvice++;
  if (buildCounterAdvice < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
  }
  buildCounterAdvice--;
}

buildUnnamed3611() {
  var o = new core.List<api.Method>();
  o.add(buildMethod());
  o.add(buildMethod());
  return o;
}

checkUnnamed3611(core.List<api.Method> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMethod(o[0]);
  checkMethod(o[1]);
}

buildUnnamed3612() {
  var o = new core.List<api.Mixin>();
  o.add(buildMixin());
  o.add(buildMixin());
  return o;
}

checkUnnamed3612(core.List<api.Mixin> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMixin(o[0]);
  checkMixin(o[1]);
}

buildUnnamed3613() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed3613(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterApi = 0;
buildApi() {
  var o = new api.Api();
  buildCounterApi++;
  if (buildCounterApi < 3) {
    o.methods = buildUnnamed3611();
    o.mixins = buildUnnamed3612();
    o.name = "foo";
    o.options = buildUnnamed3613();
    o.sourceContext = buildSourceContext();
    o.syntax = "foo";
    o.version = "foo";
  }
  buildCounterApi--;
  return o;
}

checkApi(api.Api o) {
  buildCounterApi++;
  if (buildCounterApi < 3) {
    checkUnnamed3611(o.methods);
    checkUnnamed3612(o.mixins);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3613(o.options);
    checkSourceContext(o.sourceContext);
    unittest.expect(o.syntax, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterApi--;
}

buildUnnamed3614() {
  var o = new core.List<api.AuditLogConfig>();
  o.add(buildAuditLogConfig());
  o.add(buildAuditLogConfig());
  return o;
}

checkUnnamed3614(core.List<api.AuditLogConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAuditLogConfig(o[0]);
  checkAuditLogConfig(o[1]);
}

core.int buildCounterAuditConfig = 0;
buildAuditConfig() {
  var o = new api.AuditConfig();
  buildCounterAuditConfig++;
  if (buildCounterAuditConfig < 3) {
    o.auditLogConfigs = buildUnnamed3614();
    o.service = "foo";
  }
  buildCounterAuditConfig--;
  return o;
}

checkAuditConfig(api.AuditConfig o) {
  buildCounterAuditConfig++;
  if (buildCounterAuditConfig < 3) {
    checkUnnamed3614(o.auditLogConfigs);
    unittest.expect(o.service, unittest.equals('foo'));
  }
  buildCounterAuditConfig--;
}

buildUnnamed3615() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3615(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAuditLogConfig = 0;
buildAuditLogConfig() {
  var o = new api.AuditLogConfig();
  buildCounterAuditLogConfig++;
  if (buildCounterAuditLogConfig < 3) {
    o.exemptedMembers = buildUnnamed3615();
    o.logType = "foo";
  }
  buildCounterAuditLogConfig--;
  return o;
}

checkAuditLogConfig(api.AuditLogConfig o) {
  buildCounterAuditLogConfig++;
  if (buildCounterAuditLogConfig < 3) {
    checkUnnamed3615(o.exemptedMembers);
    unittest.expect(o.logType, unittest.equals('foo'));
  }
  buildCounterAuditLogConfig--;
}

core.int buildCounterAuthProvider = 0;
buildAuthProvider() {
  var o = new api.AuthProvider();
  buildCounterAuthProvider++;
  if (buildCounterAuthProvider < 3) {
    o.audiences = "foo";
    o.authorizationUrl = "foo";
    o.id = "foo";
    o.issuer = "foo";
    o.jwksUri = "foo";
  }
  buildCounterAuthProvider--;
  return o;
}

checkAuthProvider(api.AuthProvider o) {
  buildCounterAuthProvider++;
  if (buildCounterAuthProvider < 3) {
    unittest.expect(o.audiences, unittest.equals('foo'));
    unittest.expect(o.authorizationUrl, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.issuer, unittest.equals('foo'));
    unittest.expect(o.jwksUri, unittest.equals('foo'));
  }
  buildCounterAuthProvider--;
}

core.int buildCounterAuthRequirement = 0;
buildAuthRequirement() {
  var o = new api.AuthRequirement();
  buildCounterAuthRequirement++;
  if (buildCounterAuthRequirement < 3) {
    o.audiences = "foo";
    o.providerId = "foo";
  }
  buildCounterAuthRequirement--;
  return o;
}

checkAuthRequirement(api.AuthRequirement o) {
  buildCounterAuthRequirement++;
  if (buildCounterAuthRequirement < 3) {
    unittest.expect(o.audiences, unittest.equals('foo'));
    unittest.expect(o.providerId, unittest.equals('foo'));
  }
  buildCounterAuthRequirement--;
}

buildUnnamed3616() {
  var o = new core.List<api.AuthProvider>();
  o.add(buildAuthProvider());
  o.add(buildAuthProvider());
  return o;
}

checkUnnamed3616(core.List<api.AuthProvider> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAuthProvider(o[0]);
  checkAuthProvider(o[1]);
}

buildUnnamed3617() {
  var o = new core.List<api.AuthenticationRule>();
  o.add(buildAuthenticationRule());
  o.add(buildAuthenticationRule());
  return o;
}

checkUnnamed3617(core.List<api.AuthenticationRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAuthenticationRule(o[0]);
  checkAuthenticationRule(o[1]);
}

core.int buildCounterAuthentication = 0;
buildAuthentication() {
  var o = new api.Authentication();
  buildCounterAuthentication++;
  if (buildCounterAuthentication < 3) {
    o.providers = buildUnnamed3616();
    o.rules = buildUnnamed3617();
  }
  buildCounterAuthentication--;
  return o;
}

checkAuthentication(api.Authentication o) {
  buildCounterAuthentication++;
  if (buildCounterAuthentication < 3) {
    checkUnnamed3616(o.providers);
    checkUnnamed3617(o.rules);
  }
  buildCounterAuthentication--;
}

buildUnnamed3618() {
  var o = new core.List<api.AuthRequirement>();
  o.add(buildAuthRequirement());
  o.add(buildAuthRequirement());
  return o;
}

checkUnnamed3618(core.List<api.AuthRequirement> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAuthRequirement(o[0]);
  checkAuthRequirement(o[1]);
}

core.int buildCounterAuthenticationRule = 0;
buildAuthenticationRule() {
  var o = new api.AuthenticationRule();
  buildCounterAuthenticationRule++;
  if (buildCounterAuthenticationRule < 3) {
    o.allowWithoutCredential = true;
    o.customAuth = buildCustomAuthRequirements();
    o.oauth = buildOAuthRequirements();
    o.requirements = buildUnnamed3618();
    o.selector = "foo";
  }
  buildCounterAuthenticationRule--;
  return o;
}

checkAuthenticationRule(api.AuthenticationRule o) {
  buildCounterAuthenticationRule++;
  if (buildCounterAuthenticationRule < 3) {
    unittest.expect(o.allowWithoutCredential, unittest.isTrue);
    checkCustomAuthRequirements(o.customAuth);
    checkOAuthRequirements(o.oauth);
    checkUnnamed3618(o.requirements);
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterAuthenticationRule--;
}

core.int buildCounterAuthorizationConfig = 0;
buildAuthorizationConfig() {
  var o = new api.AuthorizationConfig();
  buildCounterAuthorizationConfig++;
  if (buildCounterAuthorizationConfig < 3) {
    o.provider = "foo";
  }
  buildCounterAuthorizationConfig--;
  return o;
}

checkAuthorizationConfig(api.AuthorizationConfig o) {
  buildCounterAuthorizationConfig++;
  if (buildCounterAuthorizationConfig < 3) {
    unittest.expect(o.provider, unittest.equals('foo'));
  }
  buildCounterAuthorizationConfig--;
}

buildUnnamed3619() {
  var o = new core.List<api.BackendRule>();
  o.add(buildBackendRule());
  o.add(buildBackendRule());
  return o;
}

checkUnnamed3619(core.List<api.BackendRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBackendRule(o[0]);
  checkBackendRule(o[1]);
}

core.int buildCounterBackend = 0;
buildBackend() {
  var o = new api.Backend();
  buildCounterBackend++;
  if (buildCounterBackend < 3) {
    o.rules = buildUnnamed3619();
  }
  buildCounterBackend--;
  return o;
}

checkBackend(api.Backend o) {
  buildCounterBackend++;
  if (buildCounterBackend < 3) {
    checkUnnamed3619(o.rules);
  }
  buildCounterBackend--;
}

core.int buildCounterBackendRule = 0;
buildBackendRule() {
  var o = new api.BackendRule();
  buildCounterBackendRule++;
  if (buildCounterBackendRule < 3) {
    o.address = "foo";
    o.deadline = 42.0;
    o.minDeadline = 42.0;
    o.selector = "foo";
  }
  buildCounterBackendRule--;
  return o;
}

checkBackendRule(api.BackendRule o) {
  buildCounterBackendRule++;
  if (buildCounterBackendRule < 3) {
    unittest.expect(o.address, unittest.equals('foo'));
    unittest.expect(o.deadline, unittest.equals(42.0));
    unittest.expect(o.minDeadline, unittest.equals(42.0));
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterBackendRule--;
}

buildUnnamed3620() {
  var o = new core.List<api.BillingDestination>();
  o.add(buildBillingDestination());
  o.add(buildBillingDestination());
  return o;
}

checkUnnamed3620(core.List<api.BillingDestination> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBillingDestination(o[0]);
  checkBillingDestination(o[1]);
}

core.int buildCounterBilling = 0;
buildBilling() {
  var o = new api.Billing();
  buildCounterBilling++;
  if (buildCounterBilling < 3) {
    o.consumerDestinations = buildUnnamed3620();
  }
  buildCounterBilling--;
  return o;
}

checkBilling(api.Billing o) {
  buildCounterBilling++;
  if (buildCounterBilling < 3) {
    checkUnnamed3620(o.consumerDestinations);
  }
  buildCounterBilling--;
}

buildUnnamed3621() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3621(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterBillingDestination = 0;
buildBillingDestination() {
  var o = new api.BillingDestination();
  buildCounterBillingDestination++;
  if (buildCounterBillingDestination < 3) {
    o.metrics = buildUnnamed3621();
    o.monitoredResource = "foo";
  }
  buildCounterBillingDestination--;
  return o;
}

checkBillingDestination(api.BillingDestination o) {
  buildCounterBillingDestination++;
  if (buildCounterBillingDestination < 3) {
    checkUnnamed3621(o.metrics);
    unittest.expect(o.monitoredResource, unittest.equals('foo'));
  }
  buildCounterBillingDestination--;
}

buildUnnamed3622() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3622(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterBinding = 0;
buildBinding() {
  var o = new api.Binding();
  buildCounterBinding++;
  if (buildCounterBinding < 3) {
    o.condition = buildExpr();
    o.members = buildUnnamed3622();
    o.role = "foo";
  }
  buildCounterBinding--;
  return o;
}

checkBinding(api.Binding o) {
  buildCounterBinding++;
  if (buildCounterBinding < 3) {
    checkExpr(o.condition);
    checkUnnamed3622(o.members);
    unittest.expect(o.role, unittest.equals('foo'));
  }
  buildCounterBinding--;
}

buildUnnamed3623() {
  var o = new core.List<api.ConfigChange>();
  o.add(buildConfigChange());
  o.add(buildConfigChange());
  return o;
}

checkUnnamed3623(core.List<api.ConfigChange> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConfigChange(o[0]);
  checkConfigChange(o[1]);
}

core.int buildCounterChangeReport = 0;
buildChangeReport() {
  var o = new api.ChangeReport();
  buildCounterChangeReport++;
  if (buildCounterChangeReport < 3) {
    o.configChanges = buildUnnamed3623();
  }
  buildCounterChangeReport--;
  return o;
}

checkChangeReport(api.ChangeReport o) {
  buildCounterChangeReport++;
  if (buildCounterChangeReport < 3) {
    checkUnnamed3623(o.configChanges);
  }
  buildCounterChangeReport--;
}

buildUnnamed3624() {
  var o = new core.List<api.Advice>();
  o.add(buildAdvice());
  o.add(buildAdvice());
  return o;
}

checkUnnamed3624(core.List<api.Advice> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAdvice(o[0]);
  checkAdvice(o[1]);
}

core.int buildCounterConfigChange = 0;
buildConfigChange() {
  var o = new api.ConfigChange();
  buildCounterConfigChange++;
  if (buildCounterConfigChange < 3) {
    o.advices = buildUnnamed3624();
    o.changeType = "foo";
    o.element = "foo";
    o.newValue = "foo";
    o.oldValue = "foo";
  }
  buildCounterConfigChange--;
  return o;
}

checkConfigChange(api.ConfigChange o) {
  buildCounterConfigChange++;
  if (buildCounterConfigChange < 3) {
    checkUnnamed3624(o.advices);
    unittest.expect(o.changeType, unittest.equals('foo'));
    unittest.expect(o.element, unittest.equals('foo'));
    unittest.expect(o.newValue, unittest.equals('foo'));
    unittest.expect(o.oldValue, unittest.equals('foo'));
  }
  buildCounterConfigChange--;
}

core.int buildCounterConfigFile = 0;
buildConfigFile() {
  var o = new api.ConfigFile();
  buildCounterConfigFile++;
  if (buildCounterConfigFile < 3) {
    o.fileContents = "foo";
    o.filePath = "foo";
    o.fileType = "foo";
  }
  buildCounterConfigFile--;
  return o;
}

checkConfigFile(api.ConfigFile o) {
  buildCounterConfigFile++;
  if (buildCounterConfigFile < 3) {
    unittest.expect(o.fileContents, unittest.equals('foo'));
    unittest.expect(o.filePath, unittest.equals('foo'));
    unittest.expect(o.fileType, unittest.equals('foo'));
  }
  buildCounterConfigFile--;
}

core.int buildCounterConfigRef = 0;
buildConfigRef() {
  var o = new api.ConfigRef();
  buildCounterConfigRef++;
  if (buildCounterConfigRef < 3) {
    o.name = "foo";
  }
  buildCounterConfigRef--;
  return o;
}

checkConfigRef(api.ConfigRef o) {
  buildCounterConfigRef++;
  if (buildCounterConfigRef < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterConfigRef--;
}

buildUnnamed3625() {
  var o = new core.List<api.ConfigFile>();
  o.add(buildConfigFile());
  o.add(buildConfigFile());
  return o;
}

checkUnnamed3625(core.List<api.ConfigFile> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConfigFile(o[0]);
  checkConfigFile(o[1]);
}

core.int buildCounterConfigSource = 0;
buildConfigSource() {
  var o = new api.ConfigSource();
  buildCounterConfigSource++;
  if (buildCounterConfigSource < 3) {
    o.files = buildUnnamed3625();
    o.id = "foo";
  }
  buildCounterConfigSource--;
  return o;
}

checkConfigSource(api.ConfigSource o) {
  buildCounterConfigSource++;
  if (buildCounterConfigSource < 3) {
    checkUnnamed3625(o.files);
    unittest.expect(o.id, unittest.equals('foo'));
  }
  buildCounterConfigSource--;
}

buildUnnamed3626() {
  var o = new core.List<api.ContextRule>();
  o.add(buildContextRule());
  o.add(buildContextRule());
  return o;
}

checkUnnamed3626(core.List<api.ContextRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContextRule(o[0]);
  checkContextRule(o[1]);
}

core.int buildCounterContext = 0;
buildContext() {
  var o = new api.Context();
  buildCounterContext++;
  if (buildCounterContext < 3) {
    o.rules = buildUnnamed3626();
  }
  buildCounterContext--;
  return o;
}

checkContext(api.Context o) {
  buildCounterContext++;
  if (buildCounterContext < 3) {
    checkUnnamed3626(o.rules);
  }
  buildCounterContext--;
}

buildUnnamed3627() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3627(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3628() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3628(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterContextRule = 0;
buildContextRule() {
  var o = new api.ContextRule();
  buildCounterContextRule++;
  if (buildCounterContextRule < 3) {
    o.provided = buildUnnamed3627();
    o.requested = buildUnnamed3628();
    o.selector = "foo";
  }
  buildCounterContextRule--;
  return o;
}

checkContextRule(api.ContextRule o) {
  buildCounterContextRule++;
  if (buildCounterContextRule < 3) {
    checkUnnamed3627(o.provided);
    checkUnnamed3628(o.requested);
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterContextRule--;
}

core.int buildCounterControl = 0;
buildControl() {
  var o = new api.Control();
  buildCounterControl++;
  if (buildCounterControl < 3) {
    o.environment = "foo";
  }
  buildCounterControl--;
  return o;
}

checkControl(api.Control o) {
  buildCounterControl++;
  if (buildCounterControl < 3) {
    unittest.expect(o.environment, unittest.equals('foo'));
  }
  buildCounterControl--;
}

core.int buildCounterCustomAuthRequirements = 0;
buildCustomAuthRequirements() {
  var o = new api.CustomAuthRequirements();
  buildCounterCustomAuthRequirements++;
  if (buildCounterCustomAuthRequirements < 3) {
    o.provider = "foo";
  }
  buildCounterCustomAuthRequirements--;
  return o;
}

checkCustomAuthRequirements(api.CustomAuthRequirements o) {
  buildCounterCustomAuthRequirements++;
  if (buildCounterCustomAuthRequirements < 3) {
    unittest.expect(o.provider, unittest.equals('foo'));
  }
  buildCounterCustomAuthRequirements--;
}

buildUnnamed3629() {
  var o = new core.List<api.CustomErrorRule>();
  o.add(buildCustomErrorRule());
  o.add(buildCustomErrorRule());
  return o;
}

checkUnnamed3629(core.List<api.CustomErrorRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomErrorRule(o[0]);
  checkCustomErrorRule(o[1]);
}

buildUnnamed3630() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3630(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterCustomError = 0;
buildCustomError() {
  var o = new api.CustomError();
  buildCounterCustomError++;
  if (buildCounterCustomError < 3) {
    o.rules = buildUnnamed3629();
    o.types = buildUnnamed3630();
  }
  buildCounterCustomError--;
  return o;
}

checkCustomError(api.CustomError o) {
  buildCounterCustomError++;
  if (buildCounterCustomError < 3) {
    checkUnnamed3629(o.rules);
    checkUnnamed3630(o.types);
  }
  buildCounterCustomError--;
}

core.int buildCounterCustomErrorRule = 0;
buildCustomErrorRule() {
  var o = new api.CustomErrorRule();
  buildCounterCustomErrorRule++;
  if (buildCounterCustomErrorRule < 3) {
    o.isErrorType = true;
    o.selector = "foo";
  }
  buildCounterCustomErrorRule--;
  return o;
}

checkCustomErrorRule(api.CustomErrorRule o) {
  buildCounterCustomErrorRule++;
  if (buildCounterCustomErrorRule < 3) {
    unittest.expect(o.isErrorType, unittest.isTrue);
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterCustomErrorRule--;
}

core.int buildCounterCustomHttpPattern = 0;
buildCustomHttpPattern() {
  var o = new api.CustomHttpPattern();
  buildCounterCustomHttpPattern++;
  if (buildCounterCustomHttpPattern < 3) {
    o.kind = "foo";
    o.path = "foo";
  }
  buildCounterCustomHttpPattern--;
  return o;
}

checkCustomHttpPattern(api.CustomHttpPattern o) {
  buildCounterCustomHttpPattern++;
  if (buildCounterCustomHttpPattern < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.path, unittest.equals('foo'));
  }
  buildCounterCustomHttpPattern--;
}

core.int buildCounterDeleteServiceStrategy = 0;
buildDeleteServiceStrategy() {
  var o = new api.DeleteServiceStrategy();
  buildCounterDeleteServiceStrategy++;
  if (buildCounterDeleteServiceStrategy < 3) {}
  buildCounterDeleteServiceStrategy--;
  return o;
}

checkDeleteServiceStrategy(api.DeleteServiceStrategy o) {
  buildCounterDeleteServiceStrategy++;
  if (buildCounterDeleteServiceStrategy < 3) {}
  buildCounterDeleteServiceStrategy--;
}

core.int buildCounterDiagnostic = 0;
buildDiagnostic() {
  var o = new api.Diagnostic();
  buildCounterDiagnostic++;
  if (buildCounterDiagnostic < 3) {
    o.kind = "foo";
    o.location = "foo";
    o.message = "foo";
  }
  buildCounterDiagnostic--;
  return o;
}

checkDiagnostic(api.Diagnostic o) {
  buildCounterDiagnostic++;
  if (buildCounterDiagnostic < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterDiagnostic--;
}

core.int buildCounterDisableServiceRequest = 0;
buildDisableServiceRequest() {
  var o = new api.DisableServiceRequest();
  buildCounterDisableServiceRequest++;
  if (buildCounterDisableServiceRequest < 3) {
    o.consumerId = "foo";
  }
  buildCounterDisableServiceRequest--;
  return o;
}

checkDisableServiceRequest(api.DisableServiceRequest o) {
  buildCounterDisableServiceRequest++;
  if (buildCounterDisableServiceRequest < 3) {
    unittest.expect(o.consumerId, unittest.equals('foo'));
  }
  buildCounterDisableServiceRequest--;
}

buildUnnamed3631() {
  var o = new core.List<api.Page>();
  o.add(buildPage());
  o.add(buildPage());
  return o;
}

checkUnnamed3631(core.List<api.Page> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPage(o[0]);
  checkPage(o[1]);
}

buildUnnamed3632() {
  var o = new core.List<api.DocumentationRule>();
  o.add(buildDocumentationRule());
  o.add(buildDocumentationRule());
  return o;
}

checkUnnamed3632(core.List<api.DocumentationRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDocumentationRule(o[0]);
  checkDocumentationRule(o[1]);
}

core.int buildCounterDocumentation = 0;
buildDocumentation() {
  var o = new api.Documentation();
  buildCounterDocumentation++;
  if (buildCounterDocumentation < 3) {
    o.documentationRootUrl = "foo";
    o.overview = "foo";
    o.pages = buildUnnamed3631();
    o.rules = buildUnnamed3632();
    o.summary = "foo";
  }
  buildCounterDocumentation--;
  return o;
}

checkDocumentation(api.Documentation o) {
  buildCounterDocumentation++;
  if (buildCounterDocumentation < 3) {
    unittest.expect(o.documentationRootUrl, unittest.equals('foo'));
    unittest.expect(o.overview, unittest.equals('foo'));
    checkUnnamed3631(o.pages);
    checkUnnamed3632(o.rules);
    unittest.expect(o.summary, unittest.equals('foo'));
  }
  buildCounterDocumentation--;
}

core.int buildCounterDocumentationRule = 0;
buildDocumentationRule() {
  var o = new api.DocumentationRule();
  buildCounterDocumentationRule++;
  if (buildCounterDocumentationRule < 3) {
    o.deprecationDescription = "foo";
    o.description = "foo";
    o.selector = "foo";
  }
  buildCounterDocumentationRule--;
  return o;
}

checkDocumentationRule(api.DocumentationRule o) {
  buildCounterDocumentationRule++;
  if (buildCounterDocumentationRule < 3) {
    unittest.expect(o.deprecationDescription, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterDocumentationRule--;
}

core.int buildCounterEnableServiceRequest = 0;
buildEnableServiceRequest() {
  var o = new api.EnableServiceRequest();
  buildCounterEnableServiceRequest++;
  if (buildCounterEnableServiceRequest < 3) {
    o.consumerId = "foo";
  }
  buildCounterEnableServiceRequest--;
  return o;
}

checkEnableServiceRequest(api.EnableServiceRequest o) {
  buildCounterEnableServiceRequest++;
  if (buildCounterEnableServiceRequest < 3) {
    unittest.expect(o.consumerId, unittest.equals('foo'));
  }
  buildCounterEnableServiceRequest--;
}

buildUnnamed3633() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3633(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3634() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3634(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterEndpoint = 0;
buildEndpoint() {
  var o = new api.Endpoint();
  buildCounterEndpoint++;
  if (buildCounterEndpoint < 3) {
    o.aliases = buildUnnamed3633();
    o.allowCors = true;
    o.features = buildUnnamed3634();
    o.name = "foo";
    o.target = "foo";
  }
  buildCounterEndpoint--;
  return o;
}

checkEndpoint(api.Endpoint o) {
  buildCounterEndpoint++;
  if (buildCounterEndpoint < 3) {
    checkUnnamed3633(o.aliases);
    unittest.expect(o.allowCors, unittest.isTrue);
    checkUnnamed3634(o.features);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.target, unittest.equals('foo'));
  }
  buildCounterEndpoint--;
}

buildUnnamed3635() {
  var o = new core.List<api.EnumValue>();
  o.add(buildEnumValue());
  o.add(buildEnumValue());
  return o;
}

checkUnnamed3635(core.List<api.EnumValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEnumValue(o[0]);
  checkEnumValue(o[1]);
}

buildUnnamed3636() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed3636(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterEnum = 0;
buildEnum() {
  var o = new api.Enum();
  buildCounterEnum++;
  if (buildCounterEnum < 3) {
    o.enumvalue = buildUnnamed3635();
    o.name = "foo";
    o.options = buildUnnamed3636();
    o.sourceContext = buildSourceContext();
    o.syntax = "foo";
  }
  buildCounterEnum--;
  return o;
}

checkEnum(api.Enum o) {
  buildCounterEnum++;
  if (buildCounterEnum < 3) {
    checkUnnamed3635(o.enumvalue);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3636(o.options);
    checkSourceContext(o.sourceContext);
    unittest.expect(o.syntax, unittest.equals('foo'));
  }
  buildCounterEnum--;
}

buildUnnamed3637() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed3637(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterEnumValue = 0;
buildEnumValue() {
  var o = new api.EnumValue();
  buildCounterEnumValue++;
  if (buildCounterEnumValue < 3) {
    o.name = "foo";
    o.number = 42;
    o.options = buildUnnamed3637();
  }
  buildCounterEnumValue--;
  return o;
}

checkEnumValue(api.EnumValue o) {
  buildCounterEnumValue++;
  if (buildCounterEnumValue < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.number, unittest.equals(42));
    checkUnnamed3637(o.options);
  }
  buildCounterEnumValue--;
}

core.int buildCounterExperimental = 0;
buildExperimental() {
  var o = new api.Experimental();
  buildCounterExperimental++;
  if (buildCounterExperimental < 3) {
    o.authorization = buildAuthorizationConfig();
  }
  buildCounterExperimental--;
  return o;
}

checkExperimental(api.Experimental o) {
  buildCounterExperimental++;
  if (buildCounterExperimental < 3) {
    checkAuthorizationConfig(o.authorization);
  }
  buildCounterExperimental--;
}

core.int buildCounterExpr = 0;
buildExpr() {
  var o = new api.Expr();
  buildCounterExpr++;
  if (buildCounterExpr < 3) {
    o.description = "foo";
    o.expression = "foo";
    o.location = "foo";
    o.title = "foo";
  }
  buildCounterExpr--;
  return o;
}

checkExpr(api.Expr o) {
  buildCounterExpr++;
  if (buildCounterExpr < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.expression, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.title, unittest.equals('foo'));
  }
  buildCounterExpr--;
}

buildUnnamed3638() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed3638(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterField = 0;
buildField() {
  var o = new api.Field();
  buildCounterField++;
  if (buildCounterField < 3) {
    o.cardinality = "foo";
    o.defaultValue = "foo";
    o.jsonName = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.number = 42;
    o.oneofIndex = 42;
    o.options = buildUnnamed3638();
    o.packed = true;
    o.typeUrl = "foo";
  }
  buildCounterField--;
  return o;
}

checkField(api.Field o) {
  buildCounterField++;
  if (buildCounterField < 3) {
    unittest.expect(o.cardinality, unittest.equals('foo'));
    unittest.expect(o.defaultValue, unittest.equals('foo'));
    unittest.expect(o.jsonName, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.number, unittest.equals(42));
    unittest.expect(o.oneofIndex, unittest.equals(42));
    checkUnnamed3638(o.options);
    unittest.expect(o.packed, unittest.isTrue);
    unittest.expect(o.typeUrl, unittest.equals('foo'));
  }
  buildCounterField--;
}

buildUnnamed3639() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed3639(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted1 = (o["x"]) as core.Map;
  unittest.expect(casted1, unittest.hasLength(3));
  unittest.expect(casted1["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted1["bool"], unittest.equals(true));
  unittest.expect(casted1["string"], unittest.equals('foo'));
  var casted2 = (o["y"]) as core.Map;
  unittest.expect(casted2, unittest.hasLength(3));
  unittest.expect(casted2["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted2["bool"], unittest.equals(true));
  unittest.expect(casted2["string"], unittest.equals('foo'));
}

buildUnnamed3640() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed3640(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted3 = (o["x"]) as core.Map;
  unittest.expect(casted3, unittest.hasLength(3));
  unittest.expect(casted3["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted3["bool"], unittest.equals(true));
  unittest.expect(casted3["string"], unittest.equals('foo'));
  var casted4 = (o["y"]) as core.Map;
  unittest.expect(casted4, unittest.hasLength(3));
  unittest.expect(casted4["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted4["bool"], unittest.equals(true));
  unittest.expect(casted4["string"], unittest.equals('foo'));
}

core.int buildCounterGenerateConfigReportRequest = 0;
buildGenerateConfigReportRequest() {
  var o = new api.GenerateConfigReportRequest();
  buildCounterGenerateConfigReportRequest++;
  if (buildCounterGenerateConfigReportRequest < 3) {
    o.newConfig = buildUnnamed3639();
    o.oldConfig = buildUnnamed3640();
  }
  buildCounterGenerateConfigReportRequest--;
  return o;
}

checkGenerateConfigReportRequest(api.GenerateConfigReportRequest o) {
  buildCounterGenerateConfigReportRequest++;
  if (buildCounterGenerateConfigReportRequest < 3) {
    checkUnnamed3639(o.newConfig);
    checkUnnamed3640(o.oldConfig);
  }
  buildCounterGenerateConfigReportRequest--;
}

buildUnnamed3641() {
  var o = new core.List<api.ChangeReport>();
  o.add(buildChangeReport());
  o.add(buildChangeReport());
  return o;
}

checkUnnamed3641(core.List<api.ChangeReport> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkChangeReport(o[0]);
  checkChangeReport(o[1]);
}

buildUnnamed3642() {
  var o = new core.List<api.Diagnostic>();
  o.add(buildDiagnostic());
  o.add(buildDiagnostic());
  return o;
}

checkUnnamed3642(core.List<api.Diagnostic> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDiagnostic(o[0]);
  checkDiagnostic(o[1]);
}

core.int buildCounterGenerateConfigReportResponse = 0;
buildGenerateConfigReportResponse() {
  var o = new api.GenerateConfigReportResponse();
  buildCounterGenerateConfigReportResponse++;
  if (buildCounterGenerateConfigReportResponse < 3) {
    o.changeReports = buildUnnamed3641();
    o.diagnostics = buildUnnamed3642();
    o.id = "foo";
    o.serviceName = "foo";
  }
  buildCounterGenerateConfigReportResponse--;
  return o;
}

checkGenerateConfigReportResponse(api.GenerateConfigReportResponse o) {
  buildCounterGenerateConfigReportResponse++;
  if (buildCounterGenerateConfigReportResponse < 3) {
    checkUnnamed3641(o.changeReports);
    checkUnnamed3642(o.diagnostics);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.serviceName, unittest.equals('foo'));
  }
  buildCounterGenerateConfigReportResponse--;
}

core.int buildCounterGetIamPolicyRequest = 0;
buildGetIamPolicyRequest() {
  var o = new api.GetIamPolicyRequest();
  buildCounterGetIamPolicyRequest++;
  if (buildCounterGetIamPolicyRequest < 3) {}
  buildCounterGetIamPolicyRequest--;
  return o;
}

checkGetIamPolicyRequest(api.GetIamPolicyRequest o) {
  buildCounterGetIamPolicyRequest++;
  if (buildCounterGetIamPolicyRequest < 3) {}
  buildCounterGetIamPolicyRequest--;
}

buildUnnamed3643() {
  var o = new core.List<api.HttpRule>();
  o.add(buildHttpRule());
  o.add(buildHttpRule());
  return o;
}

checkUnnamed3643(core.List<api.HttpRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHttpRule(o[0]);
  checkHttpRule(o[1]);
}

core.int buildCounterHttp = 0;
buildHttp() {
  var o = new api.Http();
  buildCounterHttp++;
  if (buildCounterHttp < 3) {
    o.fullyDecodeReservedExpansion = true;
    o.rules = buildUnnamed3643();
  }
  buildCounterHttp--;
  return o;
}

checkHttp(api.Http o) {
  buildCounterHttp++;
  if (buildCounterHttp < 3) {
    unittest.expect(o.fullyDecodeReservedExpansion, unittest.isTrue);
    checkUnnamed3643(o.rules);
  }
  buildCounterHttp--;
}

buildUnnamed3644() {
  var o = new core.List<api.HttpRule>();
  o.add(buildHttpRule());
  o.add(buildHttpRule());
  return o;
}

checkUnnamed3644(core.List<api.HttpRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHttpRule(o[0]);
  checkHttpRule(o[1]);
}

core.int buildCounterHttpRule = 0;
buildHttpRule() {
  var o = new api.HttpRule();
  buildCounterHttpRule++;
  if (buildCounterHttpRule < 3) {
    o.additionalBindings = buildUnnamed3644();
    o.body = "foo";
    o.custom = buildCustomHttpPattern();
    o.delete = "foo";
    o.get = "foo";
    o.mediaDownload = buildMediaDownload();
    o.mediaUpload = buildMediaUpload();
    o.patch = "foo";
    o.post = "foo";
    o.put = "foo";
    o.selector = "foo";
  }
  buildCounterHttpRule--;
  return o;
}

checkHttpRule(api.HttpRule o) {
  buildCounterHttpRule++;
  if (buildCounterHttpRule < 3) {
    checkUnnamed3644(o.additionalBindings);
    unittest.expect(o.body, unittest.equals('foo'));
    checkCustomHttpPattern(o.custom);
    unittest.expect(o.delete, unittest.equals('foo'));
    unittest.expect(o.get, unittest.equals('foo'));
    checkMediaDownload(o.mediaDownload);
    checkMediaUpload(o.mediaUpload);
    unittest.expect(o.patch, unittest.equals('foo'));
    unittest.expect(o.post, unittest.equals('foo'));
    unittest.expect(o.put, unittest.equals('foo'));
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterHttpRule--;
}

core.int buildCounterLabelDescriptor = 0;
buildLabelDescriptor() {
  var o = new api.LabelDescriptor();
  buildCounterLabelDescriptor++;
  if (buildCounterLabelDescriptor < 3) {
    o.description = "foo";
    o.key = "foo";
    o.valueType = "foo";
  }
  buildCounterLabelDescriptor--;
  return o;
}

checkLabelDescriptor(api.LabelDescriptor o) {
  buildCounterLabelDescriptor++;
  if (buildCounterLabelDescriptor < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.valueType, unittest.equals('foo'));
  }
  buildCounterLabelDescriptor--;
}

buildUnnamed3645() {
  var o = new core.List<api.Operation>();
  o.add(buildOperation());
  o.add(buildOperation());
  return o;
}

checkUnnamed3645(core.List<api.Operation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperation(o[0]);
  checkOperation(o[1]);
}

core.int buildCounterListOperationsResponse = 0;
buildListOperationsResponse() {
  var o = new api.ListOperationsResponse();
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    o.nextPageToken = "foo";
    o.operations = buildUnnamed3645();
  }
  buildCounterListOperationsResponse--;
  return o;
}

checkListOperationsResponse(api.ListOperationsResponse o) {
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3645(o.operations);
  }
  buildCounterListOperationsResponse--;
}

buildUnnamed3646() {
  var o = new core.List<api.Service>();
  o.add(buildService());
  o.add(buildService());
  return o;
}

checkUnnamed3646(core.List<api.Service> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkService(o[0]);
  checkService(o[1]);
}

core.int buildCounterListServiceConfigsResponse = 0;
buildListServiceConfigsResponse() {
  var o = new api.ListServiceConfigsResponse();
  buildCounterListServiceConfigsResponse++;
  if (buildCounterListServiceConfigsResponse < 3) {
    o.nextPageToken = "foo";
    o.serviceConfigs = buildUnnamed3646();
  }
  buildCounterListServiceConfigsResponse--;
  return o;
}

checkListServiceConfigsResponse(api.ListServiceConfigsResponse o) {
  buildCounterListServiceConfigsResponse++;
  if (buildCounterListServiceConfigsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3646(o.serviceConfigs);
  }
  buildCounterListServiceConfigsResponse--;
}

buildUnnamed3647() {
  var o = new core.List<api.Rollout>();
  o.add(buildRollout());
  o.add(buildRollout());
  return o;
}

checkUnnamed3647(core.List<api.Rollout> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRollout(o[0]);
  checkRollout(o[1]);
}

core.int buildCounterListServiceRolloutsResponse = 0;
buildListServiceRolloutsResponse() {
  var o = new api.ListServiceRolloutsResponse();
  buildCounterListServiceRolloutsResponse++;
  if (buildCounterListServiceRolloutsResponse < 3) {
    o.nextPageToken = "foo";
    o.rollouts = buildUnnamed3647();
  }
  buildCounterListServiceRolloutsResponse--;
  return o;
}

checkListServiceRolloutsResponse(api.ListServiceRolloutsResponse o) {
  buildCounterListServiceRolloutsResponse++;
  if (buildCounterListServiceRolloutsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3647(o.rollouts);
  }
  buildCounterListServiceRolloutsResponse--;
}

buildUnnamed3648() {
  var o = new core.List<api.ManagedService>();
  o.add(buildManagedService());
  o.add(buildManagedService());
  return o;
}

checkUnnamed3648(core.List<api.ManagedService> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkManagedService(o[0]);
  checkManagedService(o[1]);
}

core.int buildCounterListServicesResponse = 0;
buildListServicesResponse() {
  var o = new api.ListServicesResponse();
  buildCounterListServicesResponse++;
  if (buildCounterListServicesResponse < 3) {
    o.nextPageToken = "foo";
    o.services = buildUnnamed3648();
  }
  buildCounterListServicesResponse--;
  return o;
}

checkListServicesResponse(api.ListServicesResponse o) {
  buildCounterListServicesResponse++;
  if (buildCounterListServicesResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3648(o.services);
  }
  buildCounterListServicesResponse--;
}

buildUnnamed3649() {
  var o = new core.List<api.LabelDescriptor>();
  o.add(buildLabelDescriptor());
  o.add(buildLabelDescriptor());
  return o;
}

checkUnnamed3649(core.List<api.LabelDescriptor> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLabelDescriptor(o[0]);
  checkLabelDescriptor(o[1]);
}

core.int buildCounterLogDescriptor = 0;
buildLogDescriptor() {
  var o = new api.LogDescriptor();
  buildCounterLogDescriptor++;
  if (buildCounterLogDescriptor < 3) {
    o.description = "foo";
    o.displayName = "foo";
    o.labels = buildUnnamed3649();
    o.name = "foo";
  }
  buildCounterLogDescriptor--;
  return o;
}

checkLogDescriptor(api.LogDescriptor o) {
  buildCounterLogDescriptor++;
  if (buildCounterLogDescriptor < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    checkUnnamed3649(o.labels);
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterLogDescriptor--;
}

buildUnnamed3650() {
  var o = new core.List<api.LoggingDestination>();
  o.add(buildLoggingDestination());
  o.add(buildLoggingDestination());
  return o;
}

checkUnnamed3650(core.List<api.LoggingDestination> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLoggingDestination(o[0]);
  checkLoggingDestination(o[1]);
}

buildUnnamed3651() {
  var o = new core.List<api.LoggingDestination>();
  o.add(buildLoggingDestination());
  o.add(buildLoggingDestination());
  return o;
}

checkUnnamed3651(core.List<api.LoggingDestination> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLoggingDestination(o[0]);
  checkLoggingDestination(o[1]);
}

core.int buildCounterLogging = 0;
buildLogging() {
  var o = new api.Logging();
  buildCounterLogging++;
  if (buildCounterLogging < 3) {
    o.consumerDestinations = buildUnnamed3650();
    o.producerDestinations = buildUnnamed3651();
  }
  buildCounterLogging--;
  return o;
}

checkLogging(api.Logging o) {
  buildCounterLogging++;
  if (buildCounterLogging < 3) {
    checkUnnamed3650(o.consumerDestinations);
    checkUnnamed3651(o.producerDestinations);
  }
  buildCounterLogging--;
}

buildUnnamed3652() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3652(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterLoggingDestination = 0;
buildLoggingDestination() {
  var o = new api.LoggingDestination();
  buildCounterLoggingDestination++;
  if (buildCounterLoggingDestination < 3) {
    o.logs = buildUnnamed3652();
    o.monitoredResource = "foo";
  }
  buildCounterLoggingDestination--;
  return o;
}

checkLoggingDestination(api.LoggingDestination o) {
  buildCounterLoggingDestination++;
  if (buildCounterLoggingDestination < 3) {
    checkUnnamed3652(o.logs);
    unittest.expect(o.monitoredResource, unittest.equals('foo'));
  }
  buildCounterLoggingDestination--;
}

core.int buildCounterManagedService = 0;
buildManagedService() {
  var o = new api.ManagedService();
  buildCounterManagedService++;
  if (buildCounterManagedService < 3) {
    o.producerProjectId = "foo";
    o.serviceName = "foo";
  }
  buildCounterManagedService--;
  return o;
}

checkManagedService(api.ManagedService o) {
  buildCounterManagedService++;
  if (buildCounterManagedService < 3) {
    unittest.expect(o.producerProjectId, unittest.equals('foo'));
    unittest.expect(o.serviceName, unittest.equals('foo'));
  }
  buildCounterManagedService--;
}

core.int buildCounterMediaDownload = 0;
buildMediaDownload() {
  var o = new api.MediaDownload();
  buildCounterMediaDownload++;
  if (buildCounterMediaDownload < 3) {
    o.completeNotification = true;
    o.downloadService = "foo";
    o.dropzone = "foo";
    o.enabled = true;
    o.maxDirectDownloadSize = "foo";
    o.useDirectDownload = true;
  }
  buildCounterMediaDownload--;
  return o;
}

checkMediaDownload(api.MediaDownload o) {
  buildCounterMediaDownload++;
  if (buildCounterMediaDownload < 3) {
    unittest.expect(o.completeNotification, unittest.isTrue);
    unittest.expect(o.downloadService, unittest.equals('foo'));
    unittest.expect(o.dropzone, unittest.equals('foo'));
    unittest.expect(o.enabled, unittest.isTrue);
    unittest.expect(o.maxDirectDownloadSize, unittest.equals('foo'));
    unittest.expect(o.useDirectDownload, unittest.isTrue);
  }
  buildCounterMediaDownload--;
}

buildUnnamed3653() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3653(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterMediaUpload = 0;
buildMediaUpload() {
  var o = new api.MediaUpload();
  buildCounterMediaUpload++;
  if (buildCounterMediaUpload < 3) {
    o.completeNotification = true;
    o.dropzone = "foo";
    o.enabled = true;
    o.maxSize = "foo";
    o.mimeTypes = buildUnnamed3653();
    o.progressNotification = true;
    o.startNotification = true;
    o.uploadService = "foo";
  }
  buildCounterMediaUpload--;
  return o;
}

checkMediaUpload(api.MediaUpload o) {
  buildCounterMediaUpload++;
  if (buildCounterMediaUpload < 3) {
    unittest.expect(o.completeNotification, unittest.isTrue);
    unittest.expect(o.dropzone, unittest.equals('foo'));
    unittest.expect(o.enabled, unittest.isTrue);
    unittest.expect(o.maxSize, unittest.equals('foo'));
    checkUnnamed3653(o.mimeTypes);
    unittest.expect(o.progressNotification, unittest.isTrue);
    unittest.expect(o.startNotification, unittest.isTrue);
    unittest.expect(o.uploadService, unittest.equals('foo'));
  }
  buildCounterMediaUpload--;
}

buildUnnamed3654() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed3654(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterMethod = 0;
buildMethod() {
  var o = new api.Method();
  buildCounterMethod++;
  if (buildCounterMethod < 3) {
    o.name = "foo";
    o.options = buildUnnamed3654();
    o.requestStreaming = true;
    o.requestTypeUrl = "foo";
    o.responseStreaming = true;
    o.responseTypeUrl = "foo";
    o.syntax = "foo";
  }
  buildCounterMethod--;
  return o;
}

checkMethod(api.Method o) {
  buildCounterMethod++;
  if (buildCounterMethod < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3654(o.options);
    unittest.expect(o.requestStreaming, unittest.isTrue);
    unittest.expect(o.requestTypeUrl, unittest.equals('foo'));
    unittest.expect(o.responseStreaming, unittest.isTrue);
    unittest.expect(o.responseTypeUrl, unittest.equals('foo'));
    unittest.expect(o.syntax, unittest.equals('foo'));
  }
  buildCounterMethod--;
}

buildUnnamed3655() {
  var o = new core.List<api.LabelDescriptor>();
  o.add(buildLabelDescriptor());
  o.add(buildLabelDescriptor());
  return o;
}

checkUnnamed3655(core.List<api.LabelDescriptor> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLabelDescriptor(o[0]);
  checkLabelDescriptor(o[1]);
}

core.int buildCounterMetricDescriptor = 0;
buildMetricDescriptor() {
  var o = new api.MetricDescriptor();
  buildCounterMetricDescriptor++;
  if (buildCounterMetricDescriptor < 3) {
    o.description = "foo";
    o.displayName = "foo";
    o.labels = buildUnnamed3655();
    o.metricKind = "foo";
    o.name = "foo";
    o.type = "foo";
    o.unit = "foo";
    o.valueType = "foo";
  }
  buildCounterMetricDescriptor--;
  return o;
}

checkMetricDescriptor(api.MetricDescriptor o) {
  buildCounterMetricDescriptor++;
  if (buildCounterMetricDescriptor < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    checkUnnamed3655(o.labels);
    unittest.expect(o.metricKind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.unit, unittest.equals('foo'));
    unittest.expect(o.valueType, unittest.equals('foo'));
  }
  buildCounterMetricDescriptor--;
}

buildUnnamed3656() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3656(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterMetricRule = 0;
buildMetricRule() {
  var o = new api.MetricRule();
  buildCounterMetricRule++;
  if (buildCounterMetricRule < 3) {
    o.metricCosts = buildUnnamed3656();
    o.selector = "foo";
  }
  buildCounterMetricRule--;
  return o;
}

checkMetricRule(api.MetricRule o) {
  buildCounterMetricRule++;
  if (buildCounterMetricRule < 3) {
    checkUnnamed3656(o.metricCosts);
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterMetricRule--;
}

core.int buildCounterMixin = 0;
buildMixin() {
  var o = new api.Mixin();
  buildCounterMixin++;
  if (buildCounterMixin < 3) {
    o.name = "foo";
    o.root = "foo";
  }
  buildCounterMixin--;
  return o;
}

checkMixin(api.Mixin o) {
  buildCounterMixin++;
  if (buildCounterMixin < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.root, unittest.equals('foo'));
  }
  buildCounterMixin--;
}

buildUnnamed3657() {
  var o = new core.List<api.LabelDescriptor>();
  o.add(buildLabelDescriptor());
  o.add(buildLabelDescriptor());
  return o;
}

checkUnnamed3657(core.List<api.LabelDescriptor> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLabelDescriptor(o[0]);
  checkLabelDescriptor(o[1]);
}

core.int buildCounterMonitoredResourceDescriptor = 0;
buildMonitoredResourceDescriptor() {
  var o = new api.MonitoredResourceDescriptor();
  buildCounterMonitoredResourceDescriptor++;
  if (buildCounterMonitoredResourceDescriptor < 3) {
    o.description = "foo";
    o.displayName = "foo";
    o.labels = buildUnnamed3657();
    o.name = "foo";
    o.type = "foo";
  }
  buildCounterMonitoredResourceDescriptor--;
  return o;
}

checkMonitoredResourceDescriptor(api.MonitoredResourceDescriptor o) {
  buildCounterMonitoredResourceDescriptor++;
  if (buildCounterMonitoredResourceDescriptor < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    checkUnnamed3657(o.labels);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterMonitoredResourceDescriptor--;
}

buildUnnamed3658() {
  var o = new core.List<api.MonitoringDestination>();
  o.add(buildMonitoringDestination());
  o.add(buildMonitoringDestination());
  return o;
}

checkUnnamed3658(core.List<api.MonitoringDestination> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMonitoringDestination(o[0]);
  checkMonitoringDestination(o[1]);
}

buildUnnamed3659() {
  var o = new core.List<api.MonitoringDestination>();
  o.add(buildMonitoringDestination());
  o.add(buildMonitoringDestination());
  return o;
}

checkUnnamed3659(core.List<api.MonitoringDestination> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMonitoringDestination(o[0]);
  checkMonitoringDestination(o[1]);
}

core.int buildCounterMonitoring = 0;
buildMonitoring() {
  var o = new api.Monitoring();
  buildCounterMonitoring++;
  if (buildCounterMonitoring < 3) {
    o.consumerDestinations = buildUnnamed3658();
    o.producerDestinations = buildUnnamed3659();
  }
  buildCounterMonitoring--;
  return o;
}

checkMonitoring(api.Monitoring o) {
  buildCounterMonitoring++;
  if (buildCounterMonitoring < 3) {
    checkUnnamed3658(o.consumerDestinations);
    checkUnnamed3659(o.producerDestinations);
  }
  buildCounterMonitoring--;
}

buildUnnamed3660() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3660(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterMonitoringDestination = 0;
buildMonitoringDestination() {
  var o = new api.MonitoringDestination();
  buildCounterMonitoringDestination++;
  if (buildCounterMonitoringDestination < 3) {
    o.metrics = buildUnnamed3660();
    o.monitoredResource = "foo";
  }
  buildCounterMonitoringDestination--;
  return o;
}

checkMonitoringDestination(api.MonitoringDestination o) {
  buildCounterMonitoringDestination++;
  if (buildCounterMonitoringDestination < 3) {
    checkUnnamed3660(o.metrics);
    unittest.expect(o.monitoredResource, unittest.equals('foo'));
  }
  buildCounterMonitoringDestination--;
}

core.int buildCounterOAuthRequirements = 0;
buildOAuthRequirements() {
  var o = new api.OAuthRequirements();
  buildCounterOAuthRequirements++;
  if (buildCounterOAuthRequirements < 3) {
    o.canonicalScopes = "foo";
  }
  buildCounterOAuthRequirements--;
  return o;
}

checkOAuthRequirements(api.OAuthRequirements o) {
  buildCounterOAuthRequirements++;
  if (buildCounterOAuthRequirements < 3) {
    unittest.expect(o.canonicalScopes, unittest.equals('foo'));
  }
  buildCounterOAuthRequirements--;
}

buildUnnamed3661() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed3661(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted5 = (o["x"]) as core.Map;
  unittest.expect(casted5, unittest.hasLength(3));
  unittest.expect(casted5["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted5["bool"], unittest.equals(true));
  unittest.expect(casted5["string"], unittest.equals('foo'));
  var casted6 = (o["y"]) as core.Map;
  unittest.expect(casted6, unittest.hasLength(3));
  unittest.expect(casted6["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted6["bool"], unittest.equals(true));
  unittest.expect(casted6["string"], unittest.equals('foo'));
}

buildUnnamed3662() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed3662(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted7 = (o["x"]) as core.Map;
  unittest.expect(casted7, unittest.hasLength(3));
  unittest.expect(casted7["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted7["bool"], unittest.equals(true));
  unittest.expect(casted7["string"], unittest.equals('foo'));
  var casted8 = (o["y"]) as core.Map;
  unittest.expect(casted8, unittest.hasLength(3));
  unittest.expect(casted8["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted8["bool"], unittest.equals(true));
  unittest.expect(casted8["string"], unittest.equals('foo'));
}

core.int buildCounterOperation = 0;
buildOperation() {
  var o = new api.Operation();
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    o.done = true;
    o.error = buildStatus();
    o.metadata = buildUnnamed3661();
    o.name = "foo";
    o.response = buildUnnamed3662();
  }
  buildCounterOperation--;
  return o;
}

checkOperation(api.Operation o) {
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    unittest.expect(o.done, unittest.isTrue);
    checkStatus(o.error);
    checkUnnamed3661(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3662(o.response);
  }
  buildCounterOperation--;
}

buildUnnamed3663() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3663(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3664() {
  var o = new core.List<api.Step>();
  o.add(buildStep());
  o.add(buildStep());
  return o;
}

checkUnnamed3664(core.List<api.Step> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStep(o[0]);
  checkStep(o[1]);
}

core.int buildCounterOperationMetadata = 0;
buildOperationMetadata() {
  var o = new api.OperationMetadata();
  buildCounterOperationMetadata++;
  if (buildCounterOperationMetadata < 3) {
    o.progressPercentage = 42;
    o.resourceNames = buildUnnamed3663();
    o.startTime = "foo";
    o.steps = buildUnnamed3664();
  }
  buildCounterOperationMetadata--;
  return o;
}

checkOperationMetadata(api.OperationMetadata o) {
  buildCounterOperationMetadata++;
  if (buildCounterOperationMetadata < 3) {
    unittest.expect(o.progressPercentage, unittest.equals(42));
    checkUnnamed3663(o.resourceNames);
    unittest.expect(o.startTime, unittest.equals('foo'));
    checkUnnamed3664(o.steps);
  }
  buildCounterOperationMetadata--;
}

buildUnnamed3665() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed3665(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted9 = (o["x"]) as core.Map;
  unittest.expect(casted9, unittest.hasLength(3));
  unittest.expect(casted9["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted9["bool"], unittest.equals(true));
  unittest.expect(casted9["string"], unittest.equals('foo'));
  var casted10 = (o["y"]) as core.Map;
  unittest.expect(casted10, unittest.hasLength(3));
  unittest.expect(casted10["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted10["bool"], unittest.equals(true));
  unittest.expect(casted10["string"], unittest.equals('foo'));
}

core.int buildCounterOption = 0;
buildOption() {
  var o = new api.Option();
  buildCounterOption++;
  if (buildCounterOption < 3) {
    o.name = "foo";
    o.value = buildUnnamed3665();
  }
  buildCounterOption--;
  return o;
}

checkOption(api.Option o) {
  buildCounterOption++;
  if (buildCounterOption < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3665(o.value);
  }
  buildCounterOption--;
}

buildUnnamed3666() {
  var o = new core.List<api.Page>();
  o.add(buildPage());
  o.add(buildPage());
  return o;
}

checkUnnamed3666(core.List<api.Page> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPage(o[0]);
  checkPage(o[1]);
}

core.int buildCounterPage = 0;
buildPage() {
  var o = new api.Page();
  buildCounterPage++;
  if (buildCounterPage < 3) {
    o.content = "foo";
    o.name = "foo";
    o.subpages = buildUnnamed3666();
  }
  buildCounterPage--;
  return o;
}

checkPage(api.Page o) {
  buildCounterPage++;
  if (buildCounterPage < 3) {
    unittest.expect(o.content, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3666(o.subpages);
  }
  buildCounterPage--;
}

buildUnnamed3667() {
  var o = new core.List<api.AuditConfig>();
  o.add(buildAuditConfig());
  o.add(buildAuditConfig());
  return o;
}

checkUnnamed3667(core.List<api.AuditConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAuditConfig(o[0]);
  checkAuditConfig(o[1]);
}

buildUnnamed3668() {
  var o = new core.List<api.Binding>();
  o.add(buildBinding());
  o.add(buildBinding());
  return o;
}

checkUnnamed3668(core.List<api.Binding> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBinding(o[0]);
  checkBinding(o[1]);
}

core.int buildCounterPolicy = 0;
buildPolicy() {
  var o = new api.Policy();
  buildCounterPolicy++;
  if (buildCounterPolicy < 3) {
    o.auditConfigs = buildUnnamed3667();
    o.bindings = buildUnnamed3668();
    o.etag = "foo";
    o.version = 42;
  }
  buildCounterPolicy--;
  return o;
}

checkPolicy(api.Policy o) {
  buildCounterPolicy++;
  if (buildCounterPolicy < 3) {
    checkUnnamed3667(o.auditConfigs);
    checkUnnamed3668(o.bindings);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals(42));
  }
  buildCounterPolicy--;
}

buildUnnamed3669() {
  var o = new core.List<api.QuotaLimit>();
  o.add(buildQuotaLimit());
  o.add(buildQuotaLimit());
  return o;
}

checkUnnamed3669(core.List<api.QuotaLimit> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQuotaLimit(o[0]);
  checkQuotaLimit(o[1]);
}

buildUnnamed3670() {
  var o = new core.List<api.MetricRule>();
  o.add(buildMetricRule());
  o.add(buildMetricRule());
  return o;
}

checkUnnamed3670(core.List<api.MetricRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricRule(o[0]);
  checkMetricRule(o[1]);
}

core.int buildCounterQuota = 0;
buildQuota() {
  var o = new api.Quota();
  buildCounterQuota++;
  if (buildCounterQuota < 3) {
    o.limits = buildUnnamed3669();
    o.metricRules = buildUnnamed3670();
  }
  buildCounterQuota--;
  return o;
}

checkQuota(api.Quota o) {
  buildCounterQuota++;
  if (buildCounterQuota < 3) {
    checkUnnamed3669(o.limits);
    checkUnnamed3670(o.metricRules);
  }
  buildCounterQuota--;
}

buildUnnamed3671() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3671(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterQuotaLimit = 0;
buildQuotaLimit() {
  var o = new api.QuotaLimit();
  buildCounterQuotaLimit++;
  if (buildCounterQuotaLimit < 3) {
    o.defaultLimit = "foo";
    o.description = "foo";
    o.displayName = "foo";
    o.duration = "foo";
    o.freeTier = "foo";
    o.maxLimit = "foo";
    o.metric = "foo";
    o.name = "foo";
    o.unit = "foo";
    o.values = buildUnnamed3671();
  }
  buildCounterQuotaLimit--;
  return o;
}

checkQuotaLimit(api.QuotaLimit o) {
  buildCounterQuotaLimit++;
  if (buildCounterQuotaLimit < 3) {
    unittest.expect(o.defaultLimit, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.duration, unittest.equals('foo'));
    unittest.expect(o.freeTier, unittest.equals('foo'));
    unittest.expect(o.maxLimit, unittest.equals('foo'));
    unittest.expect(o.metric, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.unit, unittest.equals('foo'));
    checkUnnamed3671(o.values);
  }
  buildCounterQuotaLimit--;
}

core.int buildCounterRollout = 0;
buildRollout() {
  var o = new api.Rollout();
  buildCounterRollout++;
  if (buildCounterRollout < 3) {
    o.createTime = "foo";
    o.createdBy = "foo";
    o.deleteServiceStrategy = buildDeleteServiceStrategy();
    o.rolloutId = "foo";
    o.serviceName = "foo";
    o.status = "foo";
    o.trafficPercentStrategy = buildTrafficPercentStrategy();
  }
  buildCounterRollout--;
  return o;
}

checkRollout(api.Rollout o) {
  buildCounterRollout++;
  if (buildCounterRollout < 3) {
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.createdBy, unittest.equals('foo'));
    checkDeleteServiceStrategy(o.deleteServiceStrategy);
    unittest.expect(o.rolloutId, unittest.equals('foo'));
    unittest.expect(o.serviceName, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    checkTrafficPercentStrategy(o.trafficPercentStrategy);
  }
  buildCounterRollout--;
}

buildUnnamed3672() {
  var o = new core.List<api.Api>();
  o.add(buildApi());
  o.add(buildApi());
  return o;
}

checkUnnamed3672(core.List<api.Api> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkApi(o[0]);
  checkApi(o[1]);
}

buildUnnamed3673() {
  var o = new core.List<api.Endpoint>();
  o.add(buildEndpoint());
  o.add(buildEndpoint());
  return o;
}

checkUnnamed3673(core.List<api.Endpoint> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEndpoint(o[0]);
  checkEndpoint(o[1]);
}

buildUnnamed3674() {
  var o = new core.List<api.Enum>();
  o.add(buildEnum());
  o.add(buildEnum());
  return o;
}

checkUnnamed3674(core.List<api.Enum> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEnum(o[0]);
  checkEnum(o[1]);
}

buildUnnamed3675() {
  var o = new core.List<api.LogDescriptor>();
  o.add(buildLogDescriptor());
  o.add(buildLogDescriptor());
  return o;
}

checkUnnamed3675(core.List<api.LogDescriptor> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLogDescriptor(o[0]);
  checkLogDescriptor(o[1]);
}

buildUnnamed3676() {
  var o = new core.List<api.MetricDescriptor>();
  o.add(buildMetricDescriptor());
  o.add(buildMetricDescriptor());
  return o;
}

checkUnnamed3676(core.List<api.MetricDescriptor> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricDescriptor(o[0]);
  checkMetricDescriptor(o[1]);
}

buildUnnamed3677() {
  var o = new core.List<api.MonitoredResourceDescriptor>();
  o.add(buildMonitoredResourceDescriptor());
  o.add(buildMonitoredResourceDescriptor());
  return o;
}

checkUnnamed3677(core.List<api.MonitoredResourceDescriptor> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMonitoredResourceDescriptor(o[0]);
  checkMonitoredResourceDescriptor(o[1]);
}

buildUnnamed3678() {
  var o = new core.List<api.Type>();
  o.add(buildType());
  o.add(buildType());
  return o;
}

checkUnnamed3678(core.List<api.Type> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkType(o[0]);
  checkType(o[1]);
}

buildUnnamed3679() {
  var o = new core.List<api.Type>();
  o.add(buildType());
  o.add(buildType());
  return o;
}

checkUnnamed3679(core.List<api.Type> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkType(o[0]);
  checkType(o[1]);
}

core.int buildCounterService = 0;
buildService() {
  var o = new api.Service();
  buildCounterService++;
  if (buildCounterService < 3) {
    o.apis = buildUnnamed3672();
    o.authentication = buildAuthentication();
    o.backend = buildBackend();
    o.billing = buildBilling();
    o.configVersion = 42;
    o.context = buildContext();
    o.control = buildControl();
    o.customError = buildCustomError();
    o.documentation = buildDocumentation();
    o.endpoints = buildUnnamed3673();
    o.enums = buildUnnamed3674();
    o.experimental = buildExperimental();
    o.http = buildHttp();
    o.id = "foo";
    o.logging = buildLogging();
    o.logs = buildUnnamed3675();
    o.metrics = buildUnnamed3676();
    o.monitoredResources = buildUnnamed3677();
    o.monitoring = buildMonitoring();
    o.name = "foo";
    o.producerProjectId = "foo";
    o.quota = buildQuota();
    o.sourceInfo = buildSourceInfo();
    o.systemParameters = buildSystemParameters();
    o.systemTypes = buildUnnamed3678();
    o.title = "foo";
    o.types = buildUnnamed3679();
    o.usage = buildUsage();
    o.visibility = buildVisibility();
  }
  buildCounterService--;
  return o;
}

checkService(api.Service o) {
  buildCounterService++;
  if (buildCounterService < 3) {
    checkUnnamed3672(o.apis);
    checkAuthentication(o.authentication);
    checkBackend(o.backend);
    checkBilling(o.billing);
    unittest.expect(o.configVersion, unittest.equals(42));
    checkContext(o.context);
    checkControl(o.control);
    checkCustomError(o.customError);
    checkDocumentation(o.documentation);
    checkUnnamed3673(o.endpoints);
    checkUnnamed3674(o.enums);
    checkExperimental(o.experimental);
    checkHttp(o.http);
    unittest.expect(o.id, unittest.equals('foo'));
    checkLogging(o.logging);
    checkUnnamed3675(o.logs);
    checkUnnamed3676(o.metrics);
    checkUnnamed3677(o.monitoredResources);
    checkMonitoring(o.monitoring);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.producerProjectId, unittest.equals('foo'));
    checkQuota(o.quota);
    checkSourceInfo(o.sourceInfo);
    checkSystemParameters(o.systemParameters);
    checkUnnamed3678(o.systemTypes);
    unittest.expect(o.title, unittest.equals('foo'));
    checkUnnamed3679(o.types);
    checkUsage(o.usage);
    checkVisibility(o.visibility);
  }
  buildCounterService--;
}

core.int buildCounterSetIamPolicyRequest = 0;
buildSetIamPolicyRequest() {
  var o = new api.SetIamPolicyRequest();
  buildCounterSetIamPolicyRequest++;
  if (buildCounterSetIamPolicyRequest < 3) {
    o.policy = buildPolicy();
    o.updateMask = "foo";
  }
  buildCounterSetIamPolicyRequest--;
  return o;
}

checkSetIamPolicyRequest(api.SetIamPolicyRequest o) {
  buildCounterSetIamPolicyRequest++;
  if (buildCounterSetIamPolicyRequest < 3) {
    checkPolicy(o.policy);
    unittest.expect(o.updateMask, unittest.equals('foo'));
  }
  buildCounterSetIamPolicyRequest--;
}

core.int buildCounterSourceContext = 0;
buildSourceContext() {
  var o = new api.SourceContext();
  buildCounterSourceContext++;
  if (buildCounterSourceContext < 3) {
    o.fileName = "foo";
  }
  buildCounterSourceContext--;
  return o;
}

checkSourceContext(api.SourceContext o) {
  buildCounterSourceContext++;
  if (buildCounterSourceContext < 3) {
    unittest.expect(o.fileName, unittest.equals('foo'));
  }
  buildCounterSourceContext--;
}

buildUnnamed3680() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed3680(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted11 = (o["x"]) as core.Map;
  unittest.expect(casted11, unittest.hasLength(3));
  unittest.expect(casted11["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted11["bool"], unittest.equals(true));
  unittest.expect(casted11["string"], unittest.equals('foo'));
  var casted12 = (o["y"]) as core.Map;
  unittest.expect(casted12, unittest.hasLength(3));
  unittest.expect(casted12["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted12["bool"], unittest.equals(true));
  unittest.expect(casted12["string"], unittest.equals('foo'));
}

buildUnnamed3681() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed3680());
  o.add(buildUnnamed3680());
  return o;
}

checkUnnamed3681(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed3680(o[0]);
  checkUnnamed3680(o[1]);
}

core.int buildCounterSourceInfo = 0;
buildSourceInfo() {
  var o = new api.SourceInfo();
  buildCounterSourceInfo++;
  if (buildCounterSourceInfo < 3) {
    o.sourceFiles = buildUnnamed3681();
  }
  buildCounterSourceInfo--;
  return o;
}

checkSourceInfo(api.SourceInfo o) {
  buildCounterSourceInfo++;
  if (buildCounterSourceInfo < 3) {
    checkUnnamed3681(o.sourceFiles);
  }
  buildCounterSourceInfo--;
}

buildUnnamed3682() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed3682(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted13 = (o["x"]) as core.Map;
  unittest.expect(casted13, unittest.hasLength(3));
  unittest.expect(casted13["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted13["bool"], unittest.equals(true));
  unittest.expect(casted13["string"], unittest.equals('foo'));
  var casted14 = (o["y"]) as core.Map;
  unittest.expect(casted14, unittest.hasLength(3));
  unittest.expect(casted14["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted14["bool"], unittest.equals(true));
  unittest.expect(casted14["string"], unittest.equals('foo'));
}

buildUnnamed3683() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed3682());
  o.add(buildUnnamed3682());
  return o;
}

checkUnnamed3683(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed3682(o[0]);
  checkUnnamed3682(o[1]);
}

core.int buildCounterStatus = 0;
buildStatus() {
  var o = new api.Status();
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    o.code = 42;
    o.details = buildUnnamed3683();
    o.message = "foo";
  }
  buildCounterStatus--;
  return o;
}

checkStatus(api.Status o) {
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    unittest.expect(o.code, unittest.equals(42));
    checkUnnamed3683(o.details);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterStatus--;
}

core.int buildCounterStep = 0;
buildStep() {
  var o = new api.Step();
  buildCounterStep++;
  if (buildCounterStep < 3) {
    o.description = "foo";
    o.status = "foo";
  }
  buildCounterStep--;
  return o;
}

checkStep(api.Step o) {
  buildCounterStep++;
  if (buildCounterStep < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterStep--;
}

core.int buildCounterSubmitConfigSourceRequest = 0;
buildSubmitConfigSourceRequest() {
  var o = new api.SubmitConfigSourceRequest();
  buildCounterSubmitConfigSourceRequest++;
  if (buildCounterSubmitConfigSourceRequest < 3) {
    o.configSource = buildConfigSource();
    o.validateOnly = true;
  }
  buildCounterSubmitConfigSourceRequest--;
  return o;
}

checkSubmitConfigSourceRequest(api.SubmitConfigSourceRequest o) {
  buildCounterSubmitConfigSourceRequest++;
  if (buildCounterSubmitConfigSourceRequest < 3) {
    checkConfigSource(o.configSource);
    unittest.expect(o.validateOnly, unittest.isTrue);
  }
  buildCounterSubmitConfigSourceRequest--;
}

core.int buildCounterSubmitConfigSourceResponse = 0;
buildSubmitConfigSourceResponse() {
  var o = new api.SubmitConfigSourceResponse();
  buildCounterSubmitConfigSourceResponse++;
  if (buildCounterSubmitConfigSourceResponse < 3) {
    o.serviceConfig = buildService();
  }
  buildCounterSubmitConfigSourceResponse--;
  return o;
}

checkSubmitConfigSourceResponse(api.SubmitConfigSourceResponse o) {
  buildCounterSubmitConfigSourceResponse++;
  if (buildCounterSubmitConfigSourceResponse < 3) {
    checkService(o.serviceConfig);
  }
  buildCounterSubmitConfigSourceResponse--;
}

core.int buildCounterSystemParameter = 0;
buildSystemParameter() {
  var o = new api.SystemParameter();
  buildCounterSystemParameter++;
  if (buildCounterSystemParameter < 3) {
    o.httpHeader = "foo";
    o.name = "foo";
    o.urlQueryParameter = "foo";
  }
  buildCounterSystemParameter--;
  return o;
}

checkSystemParameter(api.SystemParameter o) {
  buildCounterSystemParameter++;
  if (buildCounterSystemParameter < 3) {
    unittest.expect(o.httpHeader, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.urlQueryParameter, unittest.equals('foo'));
  }
  buildCounterSystemParameter--;
}

buildUnnamed3684() {
  var o = new core.List<api.SystemParameter>();
  o.add(buildSystemParameter());
  o.add(buildSystemParameter());
  return o;
}

checkUnnamed3684(core.List<api.SystemParameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSystemParameter(o[0]);
  checkSystemParameter(o[1]);
}

core.int buildCounterSystemParameterRule = 0;
buildSystemParameterRule() {
  var o = new api.SystemParameterRule();
  buildCounterSystemParameterRule++;
  if (buildCounterSystemParameterRule < 3) {
    o.parameters = buildUnnamed3684();
    o.selector = "foo";
  }
  buildCounterSystemParameterRule--;
  return o;
}

checkSystemParameterRule(api.SystemParameterRule o) {
  buildCounterSystemParameterRule++;
  if (buildCounterSystemParameterRule < 3) {
    checkUnnamed3684(o.parameters);
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterSystemParameterRule--;
}

buildUnnamed3685() {
  var o = new core.List<api.SystemParameterRule>();
  o.add(buildSystemParameterRule());
  o.add(buildSystemParameterRule());
  return o;
}

checkUnnamed3685(core.List<api.SystemParameterRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSystemParameterRule(o[0]);
  checkSystemParameterRule(o[1]);
}

core.int buildCounterSystemParameters = 0;
buildSystemParameters() {
  var o = new api.SystemParameters();
  buildCounterSystemParameters++;
  if (buildCounterSystemParameters < 3) {
    o.rules = buildUnnamed3685();
  }
  buildCounterSystemParameters--;
  return o;
}

checkSystemParameters(api.SystemParameters o) {
  buildCounterSystemParameters++;
  if (buildCounterSystemParameters < 3) {
    checkUnnamed3685(o.rules);
  }
  buildCounterSystemParameters--;
}

buildUnnamed3686() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3686(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTestIamPermissionsRequest = 0;
buildTestIamPermissionsRequest() {
  var o = new api.TestIamPermissionsRequest();
  buildCounterTestIamPermissionsRequest++;
  if (buildCounterTestIamPermissionsRequest < 3) {
    o.permissions = buildUnnamed3686();
  }
  buildCounterTestIamPermissionsRequest--;
  return o;
}

checkTestIamPermissionsRequest(api.TestIamPermissionsRequest o) {
  buildCounterTestIamPermissionsRequest++;
  if (buildCounterTestIamPermissionsRequest < 3) {
    checkUnnamed3686(o.permissions);
  }
  buildCounterTestIamPermissionsRequest--;
}

buildUnnamed3687() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3687(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTestIamPermissionsResponse = 0;
buildTestIamPermissionsResponse() {
  var o = new api.TestIamPermissionsResponse();
  buildCounterTestIamPermissionsResponse++;
  if (buildCounterTestIamPermissionsResponse < 3) {
    o.permissions = buildUnnamed3687();
  }
  buildCounterTestIamPermissionsResponse--;
  return o;
}

checkTestIamPermissionsResponse(api.TestIamPermissionsResponse o) {
  buildCounterTestIamPermissionsResponse++;
  if (buildCounterTestIamPermissionsResponse < 3) {
    checkUnnamed3687(o.permissions);
  }
  buildCounterTestIamPermissionsResponse--;
}

buildUnnamed3688() {
  var o = new core.Map<core.String, core.double>();
  o["x"] = 42.0;
  o["y"] = 42.0;
  return o;
}

checkUnnamed3688(core.Map<core.String, core.double> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals(42.0));
  unittest.expect(o["y"], unittest.equals(42.0));
}

core.int buildCounterTrafficPercentStrategy = 0;
buildTrafficPercentStrategy() {
  var o = new api.TrafficPercentStrategy();
  buildCounterTrafficPercentStrategy++;
  if (buildCounterTrafficPercentStrategy < 3) {
    o.percentages = buildUnnamed3688();
  }
  buildCounterTrafficPercentStrategy--;
  return o;
}

checkTrafficPercentStrategy(api.TrafficPercentStrategy o) {
  buildCounterTrafficPercentStrategy++;
  if (buildCounterTrafficPercentStrategy < 3) {
    checkUnnamed3688(o.percentages);
  }
  buildCounterTrafficPercentStrategy--;
}

buildUnnamed3689() {
  var o = new core.List<api.Field>();
  o.add(buildField());
  o.add(buildField());
  return o;
}

checkUnnamed3689(core.List<api.Field> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkField(o[0]);
  checkField(o[1]);
}

buildUnnamed3690() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3690(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3691() {
  var o = new core.List<api.Option>();
  o.add(buildOption());
  o.add(buildOption());
  return o;
}

checkUnnamed3691(core.List<api.Option> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOption(o[0]);
  checkOption(o[1]);
}

core.int buildCounterType = 0;
buildType() {
  var o = new api.Type();
  buildCounterType++;
  if (buildCounterType < 3) {
    o.fields = buildUnnamed3689();
    o.name = "foo";
    o.oneofs = buildUnnamed3690();
    o.options = buildUnnamed3691();
    o.sourceContext = buildSourceContext();
    o.syntax = "foo";
  }
  buildCounterType--;
  return o;
}

checkType(api.Type o) {
  buildCounterType++;
  if (buildCounterType < 3) {
    checkUnnamed3689(o.fields);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3690(o.oneofs);
    checkUnnamed3691(o.options);
    checkSourceContext(o.sourceContext);
    unittest.expect(o.syntax, unittest.equals('foo'));
  }
  buildCounterType--;
}

core.int buildCounterUndeleteServiceResponse = 0;
buildUndeleteServiceResponse() {
  var o = new api.UndeleteServiceResponse();
  buildCounterUndeleteServiceResponse++;
  if (buildCounterUndeleteServiceResponse < 3) {
    o.service = buildManagedService();
  }
  buildCounterUndeleteServiceResponse--;
  return o;
}

checkUndeleteServiceResponse(api.UndeleteServiceResponse o) {
  buildCounterUndeleteServiceResponse++;
  if (buildCounterUndeleteServiceResponse < 3) {
    checkManagedService(o.service);
  }
  buildCounterUndeleteServiceResponse--;
}

buildUnnamed3692() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3692(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3693() {
  var o = new core.List<api.UsageRule>();
  o.add(buildUsageRule());
  o.add(buildUsageRule());
  return o;
}

checkUnnamed3693(core.List<api.UsageRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUsageRule(o[0]);
  checkUsageRule(o[1]);
}

core.int buildCounterUsage = 0;
buildUsage() {
  var o = new api.Usage();
  buildCounterUsage++;
  if (buildCounterUsage < 3) {
    o.producerNotificationChannel = "foo";
    o.requirements = buildUnnamed3692();
    o.rules = buildUnnamed3693();
  }
  buildCounterUsage--;
  return o;
}

checkUsage(api.Usage o) {
  buildCounterUsage++;
  if (buildCounterUsage < 3) {
    unittest.expect(o.producerNotificationChannel, unittest.equals('foo'));
    checkUnnamed3692(o.requirements);
    checkUnnamed3693(o.rules);
  }
  buildCounterUsage--;
}

core.int buildCounterUsageRule = 0;
buildUsageRule() {
  var o = new api.UsageRule();
  buildCounterUsageRule++;
  if (buildCounterUsageRule < 3) {
    o.allowUnregisteredCalls = true;
    o.selector = "foo";
    o.skipServiceControl = true;
  }
  buildCounterUsageRule--;
  return o;
}

checkUsageRule(api.UsageRule o) {
  buildCounterUsageRule++;
  if (buildCounterUsageRule < 3) {
    unittest.expect(o.allowUnregisteredCalls, unittest.isTrue);
    unittest.expect(o.selector, unittest.equals('foo'));
    unittest.expect(o.skipServiceControl, unittest.isTrue);
  }
  buildCounterUsageRule--;
}

buildUnnamed3694() {
  var o = new core.List<api.VisibilityRule>();
  o.add(buildVisibilityRule());
  o.add(buildVisibilityRule());
  return o;
}

checkUnnamed3694(core.List<api.VisibilityRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVisibilityRule(o[0]);
  checkVisibilityRule(o[1]);
}

core.int buildCounterVisibility = 0;
buildVisibility() {
  var o = new api.Visibility();
  buildCounterVisibility++;
  if (buildCounterVisibility < 3) {
    o.rules = buildUnnamed3694();
  }
  buildCounterVisibility--;
  return o;
}

checkVisibility(api.Visibility o) {
  buildCounterVisibility++;
  if (buildCounterVisibility < 3) {
    checkUnnamed3694(o.rules);
  }
  buildCounterVisibility--;
}

core.int buildCounterVisibilityRule = 0;
buildVisibilityRule() {
  var o = new api.VisibilityRule();
  buildCounterVisibilityRule++;
  if (buildCounterVisibilityRule < 3) {
    o.restriction = "foo";
    o.selector = "foo";
  }
  buildCounterVisibilityRule--;
  return o;
}

checkVisibilityRule(api.VisibilityRule o) {
  buildCounterVisibilityRule++;
  if (buildCounterVisibilityRule < 3) {
    unittest.expect(o.restriction, unittest.equals('foo'));
    unittest.expect(o.selector, unittest.equals('foo'));
  }
  buildCounterVisibilityRule--;
}

main() {
  unittest.group("obj-schema-Advice", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvice();
      var od = new api.Advice.fromJson(o.toJson());
      checkAdvice(od);
    });
  });

  unittest.group("obj-schema-Api", () {
    unittest.test("to-json--from-json", () {
      var o = buildApi();
      var od = new api.Api.fromJson(o.toJson());
      checkApi(od);
    });
  });

  unittest.group("obj-schema-AuditConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuditConfig();
      var od = new api.AuditConfig.fromJson(o.toJson());
      checkAuditConfig(od);
    });
  });

  unittest.group("obj-schema-AuditLogConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuditLogConfig();
      var od = new api.AuditLogConfig.fromJson(o.toJson());
      checkAuditLogConfig(od);
    });
  });

  unittest.group("obj-schema-AuthProvider", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthProvider();
      var od = new api.AuthProvider.fromJson(o.toJson());
      checkAuthProvider(od);
    });
  });

  unittest.group("obj-schema-AuthRequirement", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthRequirement();
      var od = new api.AuthRequirement.fromJson(o.toJson());
      checkAuthRequirement(od);
    });
  });

  unittest.group("obj-schema-Authentication", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthentication();
      var od = new api.Authentication.fromJson(o.toJson());
      checkAuthentication(od);
    });
  });

  unittest.group("obj-schema-AuthenticationRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthenticationRule();
      var od = new api.AuthenticationRule.fromJson(o.toJson());
      checkAuthenticationRule(od);
    });
  });

  unittest.group("obj-schema-AuthorizationConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthorizationConfig();
      var od = new api.AuthorizationConfig.fromJson(o.toJson());
      checkAuthorizationConfig(od);
    });
  });

  unittest.group("obj-schema-Backend", () {
    unittest.test("to-json--from-json", () {
      var o = buildBackend();
      var od = new api.Backend.fromJson(o.toJson());
      checkBackend(od);
    });
  });

  unittest.group("obj-schema-BackendRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildBackendRule();
      var od = new api.BackendRule.fromJson(o.toJson());
      checkBackendRule(od);
    });
  });

  unittest.group("obj-schema-Billing", () {
    unittest.test("to-json--from-json", () {
      var o = buildBilling();
      var od = new api.Billing.fromJson(o.toJson());
      checkBilling(od);
    });
  });

  unittest.group("obj-schema-BillingDestination", () {
    unittest.test("to-json--from-json", () {
      var o = buildBillingDestination();
      var od = new api.BillingDestination.fromJson(o.toJson());
      checkBillingDestination(od);
    });
  });

  unittest.group("obj-schema-Binding", () {
    unittest.test("to-json--from-json", () {
      var o = buildBinding();
      var od = new api.Binding.fromJson(o.toJson());
      checkBinding(od);
    });
  });

  unittest.group("obj-schema-ChangeReport", () {
    unittest.test("to-json--from-json", () {
      var o = buildChangeReport();
      var od = new api.ChangeReport.fromJson(o.toJson());
      checkChangeReport(od);
    });
  });

  unittest.group("obj-schema-ConfigChange", () {
    unittest.test("to-json--from-json", () {
      var o = buildConfigChange();
      var od = new api.ConfigChange.fromJson(o.toJson());
      checkConfigChange(od);
    });
  });

  unittest.group("obj-schema-ConfigFile", () {
    unittest.test("to-json--from-json", () {
      var o = buildConfigFile();
      var od = new api.ConfigFile.fromJson(o.toJson());
      checkConfigFile(od);
    });
  });

  unittest.group("obj-schema-ConfigRef", () {
    unittest.test("to-json--from-json", () {
      var o = buildConfigRef();
      var od = new api.ConfigRef.fromJson(o.toJson());
      checkConfigRef(od);
    });
  });

  unittest.group("obj-schema-ConfigSource", () {
    unittest.test("to-json--from-json", () {
      var o = buildConfigSource();
      var od = new api.ConfigSource.fromJson(o.toJson());
      checkConfigSource(od);
    });
  });

  unittest.group("obj-schema-Context", () {
    unittest.test("to-json--from-json", () {
      var o = buildContext();
      var od = new api.Context.fromJson(o.toJson());
      checkContext(od);
    });
  });

  unittest.group("obj-schema-ContextRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildContextRule();
      var od = new api.ContextRule.fromJson(o.toJson());
      checkContextRule(od);
    });
  });

  unittest.group("obj-schema-Control", () {
    unittest.test("to-json--from-json", () {
      var o = buildControl();
      var od = new api.Control.fromJson(o.toJson());
      checkControl(od);
    });
  });

  unittest.group("obj-schema-CustomAuthRequirements", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomAuthRequirements();
      var od = new api.CustomAuthRequirements.fromJson(o.toJson());
      checkCustomAuthRequirements(od);
    });
  });

  unittest.group("obj-schema-CustomError", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomError();
      var od = new api.CustomError.fromJson(o.toJson());
      checkCustomError(od);
    });
  });

  unittest.group("obj-schema-CustomErrorRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomErrorRule();
      var od = new api.CustomErrorRule.fromJson(o.toJson());
      checkCustomErrorRule(od);
    });
  });

  unittest.group("obj-schema-CustomHttpPattern", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomHttpPattern();
      var od = new api.CustomHttpPattern.fromJson(o.toJson());
      checkCustomHttpPattern(od);
    });
  });

  unittest.group("obj-schema-DeleteServiceStrategy", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeleteServiceStrategy();
      var od = new api.DeleteServiceStrategy.fromJson(o.toJson());
      checkDeleteServiceStrategy(od);
    });
  });

  unittest.group("obj-schema-Diagnostic", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiagnostic();
      var od = new api.Diagnostic.fromJson(o.toJson());
      checkDiagnostic(od);
    });
  });

  unittest.group("obj-schema-DisableServiceRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisableServiceRequest();
      var od = new api.DisableServiceRequest.fromJson(o.toJson());
      checkDisableServiceRequest(od);
    });
  });

  unittest.group("obj-schema-Documentation", () {
    unittest.test("to-json--from-json", () {
      var o = buildDocumentation();
      var od = new api.Documentation.fromJson(o.toJson());
      checkDocumentation(od);
    });
  });

  unittest.group("obj-schema-DocumentationRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildDocumentationRule();
      var od = new api.DocumentationRule.fromJson(o.toJson());
      checkDocumentationRule(od);
    });
  });

  unittest.group("obj-schema-EnableServiceRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnableServiceRequest();
      var od = new api.EnableServiceRequest.fromJson(o.toJson());
      checkEnableServiceRequest(od);
    });
  });

  unittest.group("obj-schema-Endpoint", () {
    unittest.test("to-json--from-json", () {
      var o = buildEndpoint();
      var od = new api.Endpoint.fromJson(o.toJson());
      checkEndpoint(od);
    });
  });

  unittest.group("obj-schema-Enum", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnum();
      var od = new api.Enum.fromJson(o.toJson());
      checkEnum(od);
    });
  });

  unittest.group("obj-schema-EnumValue", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnumValue();
      var od = new api.EnumValue.fromJson(o.toJson());
      checkEnumValue(od);
    });
  });

  unittest.group("obj-schema-Experimental", () {
    unittest.test("to-json--from-json", () {
      var o = buildExperimental();
      var od = new api.Experimental.fromJson(o.toJson());
      checkExperimental(od);
    });
  });

  unittest.group("obj-schema-Expr", () {
    unittest.test("to-json--from-json", () {
      var o = buildExpr();
      var od = new api.Expr.fromJson(o.toJson());
      checkExpr(od);
    });
  });

  unittest.group("obj-schema-Field", () {
    unittest.test("to-json--from-json", () {
      var o = buildField();
      var od = new api.Field.fromJson(o.toJson());
      checkField(od);
    });
  });

  unittest.group("obj-schema-GenerateConfigReportRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildGenerateConfigReportRequest();
      var od = new api.GenerateConfigReportRequest.fromJson(o.toJson());
      checkGenerateConfigReportRequest(od);
    });
  });

  unittest.group("obj-schema-GenerateConfigReportResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGenerateConfigReportResponse();
      var od = new api.GenerateConfigReportResponse.fromJson(o.toJson());
      checkGenerateConfigReportResponse(od);
    });
  });

  unittest.group("obj-schema-GetIamPolicyRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetIamPolicyRequest();
      var od = new api.GetIamPolicyRequest.fromJson(o.toJson());
      checkGetIamPolicyRequest(od);
    });
  });

  unittest.group("obj-schema-Http", () {
    unittest.test("to-json--from-json", () {
      var o = buildHttp();
      var od = new api.Http.fromJson(o.toJson());
      checkHttp(od);
    });
  });

  unittest.group("obj-schema-HttpRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildHttpRule();
      var od = new api.HttpRule.fromJson(o.toJson());
      checkHttpRule(od);
    });
  });

  unittest.group("obj-schema-LabelDescriptor", () {
    unittest.test("to-json--from-json", () {
      var o = buildLabelDescriptor();
      var od = new api.LabelDescriptor.fromJson(o.toJson());
      checkLabelDescriptor(od);
    });
  });

  unittest.group("obj-schema-ListOperationsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListOperationsResponse();
      var od = new api.ListOperationsResponse.fromJson(o.toJson());
      checkListOperationsResponse(od);
    });
  });

  unittest.group("obj-schema-ListServiceConfigsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListServiceConfigsResponse();
      var od = new api.ListServiceConfigsResponse.fromJson(o.toJson());
      checkListServiceConfigsResponse(od);
    });
  });

  unittest.group("obj-schema-ListServiceRolloutsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListServiceRolloutsResponse();
      var od = new api.ListServiceRolloutsResponse.fromJson(o.toJson());
      checkListServiceRolloutsResponse(od);
    });
  });

  unittest.group("obj-schema-ListServicesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListServicesResponse();
      var od = new api.ListServicesResponse.fromJson(o.toJson());
      checkListServicesResponse(od);
    });
  });

  unittest.group("obj-schema-LogDescriptor", () {
    unittest.test("to-json--from-json", () {
      var o = buildLogDescriptor();
      var od = new api.LogDescriptor.fromJson(o.toJson());
      checkLogDescriptor(od);
    });
  });

  unittest.group("obj-schema-Logging", () {
    unittest.test("to-json--from-json", () {
      var o = buildLogging();
      var od = new api.Logging.fromJson(o.toJson());
      checkLogging(od);
    });
  });

  unittest.group("obj-schema-LoggingDestination", () {
    unittest.test("to-json--from-json", () {
      var o = buildLoggingDestination();
      var od = new api.LoggingDestination.fromJson(o.toJson());
      checkLoggingDestination(od);
    });
  });

  unittest.group("obj-schema-ManagedService", () {
    unittest.test("to-json--from-json", () {
      var o = buildManagedService();
      var od = new api.ManagedService.fromJson(o.toJson());
      checkManagedService(od);
    });
  });

  unittest.group("obj-schema-MediaDownload", () {
    unittest.test("to-json--from-json", () {
      var o = buildMediaDownload();
      var od = new api.MediaDownload.fromJson(o.toJson());
      checkMediaDownload(od);
    });
  });

  unittest.group("obj-schema-MediaUpload", () {
    unittest.test("to-json--from-json", () {
      var o = buildMediaUpload();
      var od = new api.MediaUpload.fromJson(o.toJson());
      checkMediaUpload(od);
    });
  });

  unittest.group("obj-schema-Method", () {
    unittest.test("to-json--from-json", () {
      var o = buildMethod();
      var od = new api.Method.fromJson(o.toJson());
      checkMethod(od);
    });
  });

  unittest.group("obj-schema-MetricDescriptor", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricDescriptor();
      var od = new api.MetricDescriptor.fromJson(o.toJson());
      checkMetricDescriptor(od);
    });
  });

  unittest.group("obj-schema-MetricRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricRule();
      var od = new api.MetricRule.fromJson(o.toJson());
      checkMetricRule(od);
    });
  });

  unittest.group("obj-schema-Mixin", () {
    unittest.test("to-json--from-json", () {
      var o = buildMixin();
      var od = new api.Mixin.fromJson(o.toJson());
      checkMixin(od);
    });
  });

  unittest.group("obj-schema-MonitoredResourceDescriptor", () {
    unittest.test("to-json--from-json", () {
      var o = buildMonitoredResourceDescriptor();
      var od = new api.MonitoredResourceDescriptor.fromJson(o.toJson());
      checkMonitoredResourceDescriptor(od);
    });
  });

  unittest.group("obj-schema-Monitoring", () {
    unittest.test("to-json--from-json", () {
      var o = buildMonitoring();
      var od = new api.Monitoring.fromJson(o.toJson());
      checkMonitoring(od);
    });
  });

  unittest.group("obj-schema-MonitoringDestination", () {
    unittest.test("to-json--from-json", () {
      var o = buildMonitoringDestination();
      var od = new api.MonitoringDestination.fromJson(o.toJson());
      checkMonitoringDestination(od);
    });
  });

  unittest.group("obj-schema-OAuthRequirements", () {
    unittest.test("to-json--from-json", () {
      var o = buildOAuthRequirements();
      var od = new api.OAuthRequirements.fromJson(o.toJson());
      checkOAuthRequirements(od);
    });
  });

  unittest.group("obj-schema-Operation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperation();
      var od = new api.Operation.fromJson(o.toJson());
      checkOperation(od);
    });
  });

  unittest.group("obj-schema-OperationMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationMetadata();
      var od = new api.OperationMetadata.fromJson(o.toJson());
      checkOperationMetadata(od);
    });
  });

  unittest.group("obj-schema-Option", () {
    unittest.test("to-json--from-json", () {
      var o = buildOption();
      var od = new api.Option.fromJson(o.toJson());
      checkOption(od);
    });
  });

  unittest.group("obj-schema-Page", () {
    unittest.test("to-json--from-json", () {
      var o = buildPage();
      var od = new api.Page.fromJson(o.toJson());
      checkPage(od);
    });
  });

  unittest.group("obj-schema-Policy", () {
    unittest.test("to-json--from-json", () {
      var o = buildPolicy();
      var od = new api.Policy.fromJson(o.toJson());
      checkPolicy(od);
    });
  });

  unittest.group("obj-schema-Quota", () {
    unittest.test("to-json--from-json", () {
      var o = buildQuota();
      var od = new api.Quota.fromJson(o.toJson());
      checkQuota(od);
    });
  });

  unittest.group("obj-schema-QuotaLimit", () {
    unittest.test("to-json--from-json", () {
      var o = buildQuotaLimit();
      var od = new api.QuotaLimit.fromJson(o.toJson());
      checkQuotaLimit(od);
    });
  });

  unittest.group("obj-schema-Rollout", () {
    unittest.test("to-json--from-json", () {
      var o = buildRollout();
      var od = new api.Rollout.fromJson(o.toJson());
      checkRollout(od);
    });
  });

  unittest.group("obj-schema-Service", () {
    unittest.test("to-json--from-json", () {
      var o = buildService();
      var od = new api.Service.fromJson(o.toJson());
      checkService(od);
    });
  });

  unittest.group("obj-schema-SetIamPolicyRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSetIamPolicyRequest();
      var od = new api.SetIamPolicyRequest.fromJson(o.toJson());
      checkSetIamPolicyRequest(od);
    });
  });

  unittest.group("obj-schema-SourceContext", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceContext();
      var od = new api.SourceContext.fromJson(o.toJson());
      checkSourceContext(od);
    });
  });

  unittest.group("obj-schema-SourceInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceInfo();
      var od = new api.SourceInfo.fromJson(o.toJson());
      checkSourceInfo(od);
    });
  });

  unittest.group("obj-schema-Status", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatus();
      var od = new api.Status.fromJson(o.toJson());
      checkStatus(od);
    });
  });

  unittest.group("obj-schema-Step", () {
    unittest.test("to-json--from-json", () {
      var o = buildStep();
      var od = new api.Step.fromJson(o.toJson());
      checkStep(od);
    });
  });

  unittest.group("obj-schema-SubmitConfigSourceRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubmitConfigSourceRequest();
      var od = new api.SubmitConfigSourceRequest.fromJson(o.toJson());
      checkSubmitConfigSourceRequest(od);
    });
  });

  unittest.group("obj-schema-SubmitConfigSourceResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubmitConfigSourceResponse();
      var od = new api.SubmitConfigSourceResponse.fromJson(o.toJson());
      checkSubmitConfigSourceResponse(od);
    });
  });

  unittest.group("obj-schema-SystemParameter", () {
    unittest.test("to-json--from-json", () {
      var o = buildSystemParameter();
      var od = new api.SystemParameter.fromJson(o.toJson());
      checkSystemParameter(od);
    });
  });

  unittest.group("obj-schema-SystemParameterRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildSystemParameterRule();
      var od = new api.SystemParameterRule.fromJson(o.toJson());
      checkSystemParameterRule(od);
    });
  });

  unittest.group("obj-schema-SystemParameters", () {
    unittest.test("to-json--from-json", () {
      var o = buildSystemParameters();
      var od = new api.SystemParameters.fromJson(o.toJson());
      checkSystemParameters(od);
    });
  });

  unittest.group("obj-schema-TestIamPermissionsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTestIamPermissionsRequest();
      var od = new api.TestIamPermissionsRequest.fromJson(o.toJson());
      checkTestIamPermissionsRequest(od);
    });
  });

  unittest.group("obj-schema-TestIamPermissionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildTestIamPermissionsResponse();
      var od = new api.TestIamPermissionsResponse.fromJson(o.toJson());
      checkTestIamPermissionsResponse(od);
    });
  });

  unittest.group("obj-schema-TrafficPercentStrategy", () {
    unittest.test("to-json--from-json", () {
      var o = buildTrafficPercentStrategy();
      var od = new api.TrafficPercentStrategy.fromJson(o.toJson());
      checkTrafficPercentStrategy(od);
    });
  });

  unittest.group("obj-schema-Type", () {
    unittest.test("to-json--from-json", () {
      var o = buildType();
      var od = new api.Type.fromJson(o.toJson());
      checkType(od);
    });
  });

  unittest.group("obj-schema-UndeleteServiceResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildUndeleteServiceResponse();
      var od = new api.UndeleteServiceResponse.fromJson(o.toJson());
      checkUndeleteServiceResponse(od);
    });
  });

  unittest.group("obj-schema-Usage", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsage();
      var od = new api.Usage.fromJson(o.toJson());
      checkUsage(od);
    });
  });

  unittest.group("obj-schema-UsageRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageRule();
      var od = new api.UsageRule.fromJson(o.toJson());
      checkUsageRule(od);
    });
  });

  unittest.group("obj-schema-Visibility", () {
    unittest.test("to-json--from-json", () {
      var o = buildVisibility();
      var od = new api.Visibility.fromJson(o.toJson());
      checkVisibility(od);
    });
  });

  unittest.group("obj-schema-VisibilityRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildVisibilityRule();
      var od = new api.VisibilityRule.fromJson(o.toJson());
      checkVisibilityRule(od);
    });
  });

  unittest.group("resource-OperationsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.OperationsResourceApi res =
          new api.ServicemanagementApi(mock).operations;
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.OperationsResourceApi res =
          new api.ServicemanagementApi(mock).operations;
      var arg_filter = "foo";
      var arg_name = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("v1/operations"));
        pathOffset += 13;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(queryMap["name"].first, unittest.equals(arg_name));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListOperationsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              filter: arg_filter,
              name: arg_name,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ListOperationsResponse response) {
        checkListOperationsResponse(response);
      })));
    });
  });

  unittest.group("resource-ServicesResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_request = buildManagedService();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ManagedService.fromJson(json);
        checkManagedService(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("v1/services"));
        pathOffset += 11;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--disable", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_request = buildDisableServiceRequest();
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DisableServiceRequest.fromJson(json);
        checkDisableServiceRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf(":disable", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals(":disable"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .disable(arg_request, arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--enable", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_request = buildEnableServiceRequest();
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.EnableServiceRequest.fromJson(json);
        checkEnableServiceRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf(":enable", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals(":enable"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .enable(arg_request, arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--generateConfigReport", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_request = buildGenerateConfigReportRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.GenerateConfigReportRequest.fromJson(json);
        checkGenerateConfigReportRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 32),
            unittest.equals("v1/services:generateConfigReport"));
        pathOffset += 32;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildGenerateConfigReportResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.generateConfigReport(arg_request, $fields: arg_$fields).then(
          unittest.expectAsync1(((api.GenerateConfigReportResponse response) {
        checkGenerateConfigReportResponse(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildManagedService());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ManagedService response) {
        checkManagedService(response);
      })));
    });

    unittest.test("method--getConfig", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_serviceName = "foo";
      var arg_configId = "foo";
      var arg_view = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/config", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/config"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["configId"].first, unittest.equals(arg_configId));
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildService());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getConfig(arg_serviceName,
              configId: arg_configId, view: arg_view, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Service response) {
        checkService(response);
      })));
    });

    unittest.test("method--getIamPolicy", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_request = buildGetIamPolicyRequest();
      var arg_resource = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.GetIamPolicyRequest.fromJson(json);
        checkGetIamPolicyRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPolicy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getIamPolicy(arg_request, arg_resource, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Policy response) {
        checkPolicy(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_pageSize = 42;
      var arg_producerProjectId = "foo";
      var arg_consumerId = "foo";
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("v1/services"));
        pathOffset += 11;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["producerProjectId"].first,
            unittest.equals(arg_producerProjectId));
        unittest.expect(
            queryMap["consumerId"].first, unittest.equals(arg_consumerId));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListServicesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              pageSize: arg_pageSize,
              producerProjectId: arg_producerProjectId,
              consumerId: arg_consumerId,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ListServicesResponse response) {
        checkListServicesResponse(response);
      })));
    });

    unittest.test("method--setIamPolicy", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_request = buildSetIamPolicyRequest();
      var arg_resource = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SetIamPolicyRequest.fromJson(json);
        checkSetIamPolicyRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPolicy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .setIamPolicy(arg_request, arg_resource, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Policy response) {
        checkPolicy(response);
      })));
    });

    unittest.test("method--testIamPermissions", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_request = buildTestIamPermissionsRequest();
      var arg_resource = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.TestIamPermissionsRequest.fromJson(json);
        checkTestIamPermissionsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTestIamPermissionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .testIamPermissions(arg_request, arg_resource, $fields: arg_$fields)
          .then(
              unittest.expectAsync1(((api.TestIamPermissionsResponse response) {
        checkTestIamPermissionsResponse(response);
      })));
    });

    unittest.test("method--undelete", () {
      var mock = new HttpServerMock();
      api.ServicesResourceApi res = new api.ServicemanagementApi(mock).services;
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf(":undelete", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals(":undelete"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .undelete(arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-ServicesConfigsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.ServicesConfigsResourceApi res =
          new api.ServicemanagementApi(mock).services.configs;
      var arg_request = buildService();
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Service.fromJson(json);
        checkService(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/configs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/configs"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildService());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Service response) {
        checkService(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ServicesConfigsResourceApi res =
          new api.ServicemanagementApi(mock).services.configs;
      var arg_serviceName = "foo";
      var arg_configId = "foo";
      var arg_view = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/configs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/configs/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_configId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildService());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_serviceName, arg_configId,
              view: arg_view, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Service response) {
        checkService(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ServicesConfigsResourceApi res =
          new api.ServicemanagementApi(mock).services.configs;
      var arg_serviceName = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/configs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/configs"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListServiceConfigsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_serviceName,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(
              unittest.expectAsync1(((api.ListServiceConfigsResponse response) {
        checkListServiceConfigsResponse(response);
      })));
    });

    unittest.test("method--submit", () {
      var mock = new HttpServerMock();
      api.ServicesConfigsResourceApi res =
          new api.ServicemanagementApi(mock).services.configs;
      var arg_request = buildSubmitConfigSourceRequest();
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SubmitConfigSourceRequest.fromJson(json);
        checkSubmitConfigSourceRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/configs:submit", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/configs:submit"));
        pathOffset += 15;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .submit(arg_request, arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-ServicesConsumersResourceApi", () {
    unittest.test("method--getIamPolicy", () {
      var mock = new HttpServerMock();
      api.ServicesConsumersResourceApi res =
          new api.ServicemanagementApi(mock).services.consumers;
      var arg_request = buildGetIamPolicyRequest();
      var arg_resource = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.GetIamPolicyRequest.fromJson(json);
        checkGetIamPolicyRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPolicy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getIamPolicy(arg_request, arg_resource, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Policy response) {
        checkPolicy(response);
      })));
    });

    unittest.test("method--setIamPolicy", () {
      var mock = new HttpServerMock();
      api.ServicesConsumersResourceApi res =
          new api.ServicemanagementApi(mock).services.consumers;
      var arg_request = buildSetIamPolicyRequest();
      var arg_resource = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SetIamPolicyRequest.fromJson(json);
        checkSetIamPolicyRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPolicy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .setIamPolicy(arg_request, arg_resource, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Policy response) {
        checkPolicy(response);
      })));
    });

    unittest.test("method--testIamPermissions", () {
      var mock = new HttpServerMock();
      api.ServicesConsumersResourceApi res =
          new api.ServicemanagementApi(mock).services.consumers;
      var arg_request = buildTestIamPermissionsRequest();
      var arg_resource = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.TestIamPermissionsRequest.fromJson(json);
        checkTestIamPermissionsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTestIamPermissionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .testIamPermissions(arg_request, arg_resource, $fields: arg_$fields)
          .then(
              unittest.expectAsync1(((api.TestIamPermissionsResponse response) {
        checkTestIamPermissionsResponse(response);
      })));
    });
  });

  unittest.group("resource-ServicesRolloutsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.ServicesRolloutsResourceApi res =
          new api.ServicemanagementApi(mock).services.rollouts;
      var arg_request = buildRollout();
      var arg_serviceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Rollout.fromJson(json);
        checkRollout(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/rollouts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/rollouts"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_serviceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ServicesRolloutsResourceApi res =
          new api.ServicemanagementApi(mock).services.rollouts;
      var arg_serviceName = "foo";
      var arg_rolloutId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/rollouts/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/rollouts/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_rolloutId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRollout());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_serviceName, arg_rolloutId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Rollout response) {
        checkRollout(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ServicesRolloutsResourceApi res =
          new api.ServicemanagementApi(mock).services.rollouts;
      var arg_serviceName = "foo";
      var arg_pageSize = 42;
      var arg_filter = "foo";
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/services/"));
        pathOffset += 12;
        index = path.indexOf("/rollouts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_serviceName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/rollouts"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListServiceRolloutsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_serviceName,
              pageSize: arg_pageSize,
              filter: arg_filter,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest
              .expectAsync1(((api.ListServiceRolloutsResponse response) {
        checkListServiceRolloutsResponse(response);
      })));
    });
  });
}
