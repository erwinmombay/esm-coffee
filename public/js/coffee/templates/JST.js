this["Handlebars"] = this["Handlebars"] || {};
this["Handlebars"]["templates"] = this["Handlebars"]["templates"] || {};

this["Handlebars"]["templates"]["BusinessEntityForm"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n      <div class=\"control-group\">\n        <label class=\"control-label\" for=\"";
  foundHelper = helpers.id;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">";
  foundHelper = helpers.label;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.label; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</label>\n          <div class=\"controls\">\n              <input id=\"";
  foundHelper = helpers.id;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\" data-target=\"";
  foundHelper = helpers.elemTarget;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.elemTarget; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\" type=\"";
  foundHelper = helpers.type;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.type; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\" value=\"";
  foundHelper = helpers.value;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.value; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\" placeholder=\"";
  foundHelper = helpers.placeholder;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.placeholder; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n          </div>\n      </div>\n    ";
  return buffer;}

  buffer += "<form class=\"form-horizontal\">\n    <fieldset>\n    ";
  stack1 = depth0.groups;
  stack1 = helpers.each.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </fieldset>\n</form>\n";
  return buffer;});

this["Handlebars"]["templates"]["Modal"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  


  return "<div id=\"modal-helper\" class=\"modal hide fade\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"modal-helper-label\" aria-hidden=\"true\">\r\n    <div class=\"modal-header\">\r\n        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n        <h3 id=\"modal-helper-label\">Modal header</h3>\r\n    </div>\r\n    <div class=\"modal-body\">\r\n    </div>\r\n    <div class=\"modal-footer\">\r\n        <button id=\"modal-helper-close\" class=\"btn\" data-dismiss=\"modal\" aria-hidden=\"true\">Close</button>\r\n        <button id=\"modal-helper-save\" class=\"btn btn-primary\">Save</button>\r\n    </div>\r\n</div>\r\n";});

this["Handlebars"]["templates"]["TableView"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  


  return "<table class=\"table table-bordered table-manual-stripe\">\n  <thead>\n    <tr>\n    </tr>\n  </thead>\n  <tbody>\n  </tbody>\n</table>\n";});