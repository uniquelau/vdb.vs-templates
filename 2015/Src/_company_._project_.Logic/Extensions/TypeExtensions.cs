using System;
using System.Reflection;

namespace _company_._project_.Logic.Extensions
{
		public static class TypeExtensions
		{
				/// <summary>
				/// Uses reflection to get the value of a public constant 'TypeAlias' of the type supplied
				/// </summary>
				/// <param name="type">type to identify a specific Model</param>
				/// <returns>the string value of the Type.Name unless a TypeAlias constant is avaiable</returns>
				public static string GetTypeAlias(this Type type)
				{
						string typeAlias = type.Name; // default return value

						FieldInfo typeAliasFieldInfo = type.GetField("TypeAlias");

						if (typeAliasFieldInfo != null)
						{
								// constant found, so get it's value
								typeAlias = typeAliasFieldInfo.GetValue(null).ToString();
						}

						return typeAlias;
				}
		}
}
