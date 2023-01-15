# [YooKassa API SDK](../home.md)

# Class: \YooKassa\Model\Deal\PaymentDealInfo
### Namespace: [\YooKassa\Model\Deal](../namespaces/yookassa-model-deal.md)
---
**Summary:**

Class PaymentDealInfo


---
### Constants
* No constants found

---
### Properties
| Visibility | Name | Flag | Summary |
| ----------:| ---- | ---- | ------- |
| public | [$id](../classes/YooKassa-Model-Deal-PaymentDealInfo.md#property_id) |  | Идентификатор сделки |
| public | [$settlements](../classes/YooKassa-Model-Deal-PaymentDealInfo.md#property_settlements) |  | Данные о распределении денег |

---
### Methods
| Visibility | Name | Flag | Summary |
| ----------:| ---- | ---- | ------- |
| public | [__construct()](../classes/YooKassa-Common-AbstractObject.md#method___construct) |  | AbstractObject constructor. |
| public | [__get()](../classes/YooKassa-Common-AbstractObject.md#method___get) |  | Возвращает значение свойства |
| public | [__isset()](../classes/YooKassa-Common-AbstractObject.md#method___isset) |  | Проверяет наличие свойства |
| public | [__set()](../classes/YooKassa-Common-AbstractObject.md#method___set) |  | Устанавливает значение свойства |
| public | [__unset()](../classes/YooKassa-Common-AbstractObject.md#method___unset) |  | Удаляет свойство |
| public | [addSettlement()](../classes/YooKassa-Model-Deal-PaymentDealInfo.md#method_addSettlement) |  | Добавляет оплату в чек |
| public | [fromArray()](../classes/YooKassa-Common-AbstractObject.md#method_fromArray) |  | Устанавливает значения свойств текущего объекта из массива |
| public | [getId()](../classes/YooKassa-Model-Deal-PaymentDealInfo.md#method_getId) |  | Возвращает Id сделки |
| public | [getSettlements()](../classes/YooKassa-Model-Deal-PaymentDealInfo.md#method_getSettlements) |  | Возвращает массив оплат, обеспечивающих выдачу товара |
| public | [jsonSerialize()](../classes/YooKassa-Common-AbstractObject.md#method_jsonSerialize) |  | Возвращает ассоциативный массив со свойствами текущего объекта для его дальнейшей JSON сериализации |
| public | [offsetExists()](../classes/YooKassa-Common-AbstractObject.md#method_offsetExists) |  | Проверяет наличие свойства |
| public | [offsetGet()](../classes/YooKassa-Common-AbstractObject.md#method_offsetGet) |  | Возвращает значение свойства |
| public | [offsetSet()](../classes/YooKassa-Common-AbstractObject.md#method_offsetSet) |  | Устанавливает значение свойства |
| public | [offsetUnset()](../classes/YooKassa-Common-AbstractObject.md#method_offsetUnset) |  | Удаляет свойство |
| public | [setId()](../classes/YooKassa-Model-Deal-PaymentDealInfo.md#method_setId) |  | Устанавливает Id сделки |
| public | [setSettlements()](../classes/YooKassa-Model-Deal-PaymentDealInfo.md#method_setSettlements) |  | Возвращает массив оплат, обеспечивающих выдачу товара |
| public | [toArray()](../classes/YooKassa-Common-AbstractObject.md#method_toArray) |  | Возвращает ассоциативный массив со свойствами текущего объекта для его дальнейшей JSON сериализации Является алиасом метода AbstractObject::jsonSerialize() |
| protected | [getUnknownProperties()](../classes/YooKassa-Common-AbstractObject.md#method_getUnknownProperties) |  | Возвращает массив свойств которые не существуют, но были заданы у объекта |

---
### Details
* File: [lib/Model/Deal/PaymentDealInfo.php](../../lib/Model/Deal/PaymentDealInfo.php)
* Package: YooKassa
* Class Hierarchy: 
  * [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)
  * \YooKassa\Model\Deal\PaymentDealInfo

---
## Properties
<a name="property_id"></a>
#### public $id : string
---
***Description***

Идентификатор сделки

**Type:** <a href="../string"><abbr title="string">string</abbr></a>

**Details:**


<a name="property_settlements"></a>
#### public $settlements : \YooKassa\Model\Deal\SettlementPayoutPayment[]
---
***Description***

Данные о распределении денег

**Type:** <a href="../\YooKassa\Model\Deal\SettlementPayoutPayment[]"><abbr title="\YooKassa\Model\Deal\SettlementPayoutPayment[]">SettlementPayoutPayment[]</abbr></a>

**Details:**



---
## Methods
<a name="method___construct" class="anchor"></a>
#### public __construct() : mixed

```php
public __construct(array $data = array()) : mixed
```

**Summary**

AbstractObject constructor.

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">array</code> | data  |  |

**Returns:** mixed - 


<a name="method___get" class="anchor"></a>
#### public __get() : mixed

```php
public __get(string $propertyName) : mixed
```

**Summary**

Возвращает значение свойства

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | propertyName  | Имя свойства |

**Returns:** mixed - Значение свойства


<a name="method___isset" class="anchor"></a>
#### public __isset() : bool

```php
public __isset(string $propertyName) : bool
```

**Summary**

Проверяет наличие свойства

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | propertyName  | Имя проверяемого свойства |

**Returns:** bool - True если свойство имеется, false если нет


<a name="method___set" class="anchor"></a>
#### public __set() : mixed

```php
public __set(string $propertyName, mixed $value) : mixed
```

**Summary**

Устанавливает значение свойства

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | propertyName  | Имя свойства |
| <code lang="php">mixed</code> | value  | Значение свойства |

**Returns:** mixed - 


<a name="method___unset" class="anchor"></a>
#### public __unset() : mixed

```php
public __unset(string $propertyName) : mixed
```

**Summary**

Удаляет свойство

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | propertyName  | Имя удаляемого свойства |

**Returns:** mixed - 


<a name="method_addSettlement" class="anchor"></a>
#### public addSettlement() : mixed

```php
public addSettlement(\YooKassa\Model\SettlementInterface $value) : mixed
```

**Summary**

Добавляет оплату в чек

**Details:**
* Inherited From: [\YooKassa\Model\Deal\PaymentDealInfo](../classes/YooKassa-Model-Deal-PaymentDealInfo.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">\YooKassa\Model\SettlementInterface</code> | value  | Объект добавляемой в чек позиции |

**Returns:** mixed - 


<a name="method_fromArray" class="anchor"></a>
#### public fromArray() : mixed

```php
public fromArray(array|\Traversable $sourceArray) : mixed
```

**Summary**

Устанавливает значения свойств текущего объекта из массива

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">array OR \Traversable</code> | sourceArray  | Ассоциативный массив с настройками |

**Returns:** mixed - 


<a name="method_getId" class="anchor"></a>
#### public getId() : mixed

```php
public getId() : mixed
```

**Summary**

Возвращает Id сделки

**Details:**
* Inherited From: [\YooKassa\Model\Deal\PaymentDealInfo](../classes/YooKassa-Model-Deal-PaymentDealInfo.md)

**Returns:** mixed - 


<a name="method_getSettlements" class="anchor"></a>
#### public getSettlements() : \YooKassa\Model\SettlementInterface[]

```php
public getSettlements() : \YooKassa\Model\SettlementInterface[]
```

**Summary**

Возвращает массив оплат, обеспечивающих выдачу товара

**Details:**
* Inherited From: [\YooKassa\Model\Deal\PaymentDealInfo](../classes/YooKassa-Model-Deal-PaymentDealInfo.md)

**Returns:** \YooKassa\Model\SettlementInterface[] - Массив оплат, обеспечивающих выдачу товара.


<a name="method_jsonSerialize" class="anchor"></a>
#### public jsonSerialize() : array

```php
public jsonSerialize() : array
```

**Summary**

Возвращает ассоциативный массив со свойствами текущего объекта для его дальнейшей JSON сериализации

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

**Returns:** array - Ассоциативный массив со свойствами текущего объекта


<a name="method_offsetExists" class="anchor"></a>
#### public offsetExists() : bool

```php
public offsetExists(string $offset) : bool
```

**Summary**

Проверяет наличие свойства

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | offset  | Имя проверяемого свойства |

**Returns:** bool - True если свойство имеется, false если нет


<a name="method_offsetGet" class="anchor"></a>
#### public offsetGet() : mixed

```php
public offsetGet(string $offset) : mixed
```

**Summary**

Возвращает значение свойства

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | offset  | Имя свойства |

**Returns:** mixed - Значение свойства


<a name="method_offsetSet" class="anchor"></a>
#### public offsetSet() : mixed

```php
public offsetSet(string $offset, mixed $value) : mixed
```

**Summary**

Устанавливает значение свойства

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | offset  | Имя свойства |
| <code lang="php">mixed</code> | value  | Значение свойства |

**Returns:** mixed - 


<a name="method_offsetUnset" class="anchor"></a>
#### public offsetUnset() : mixed

```php
public offsetUnset(string $offset) : mixed
```

**Summary**

Удаляет свойство

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | offset  | Имя удаляемого свойства |

**Returns:** mixed - 


<a name="method_setId" class="anchor"></a>
#### public setId() : \YooKassa\Model\Deal\PaymentDealInfo

```php
public setId(string $value) : \YooKassa\Model\Deal\PaymentDealInfo
```

**Summary**

Устанавливает Id сделки

**Details:**
* Inherited From: [\YooKassa\Model\Deal\PaymentDealInfo](../classes/YooKassa-Model-Deal-PaymentDealInfo.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">string</code> | value  | Id сделки |

**Returns:** \YooKassa\Model\Deal\PaymentDealInfo - 


<a name="method_setSettlements" class="anchor"></a>
#### public setSettlements() : mixed

```php
public setSettlements(\YooKassa\Model\SettlementInterface[]|array $value) : mixed
```

**Summary**

Возвращает массив оплат, обеспечивающих выдачу товара

**Details:**
* Inherited From: [\YooKassa\Model\Deal\PaymentDealInfo](../classes/YooKassa-Model-Deal-PaymentDealInfo.md)

##### Parameters:
| Type | Name | Description |
| ---- | ---- | ----------- |
| <code lang="php">\YooKassa\Model\SettlementInterface[] OR array</code> | value  |  |

**Returns:** mixed - 


<a name="method_toArray" class="anchor"></a>
#### public toArray() : array

```php
public toArray() : array
```

**Summary**

Возвращает ассоциативный массив со свойствами текущего объекта для его дальнейшей JSON сериализации
Является алиасом метода AbstractObject::jsonSerialize()

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

**Returns:** array - Ассоциативный массив со свойствами текущего объекта


<a name="method_getUnknownProperties" class="anchor"></a>
#### protected getUnknownProperties() : array

```php
protected getUnknownProperties() : array
```

**Summary**

Возвращает массив свойств которые не существуют, но были заданы у объекта

**Details:**
* Inherited From: [\YooKassa\Common\AbstractObject](../classes/YooKassa-Common-AbstractObject.md)

**Returns:** array - Ассоциативный массив с не существующими у текущего объекта свойствами



---

### Top Namespaces

* [\YooKassa](../namespaces/yookassa.md)

---

### Reports
* [Errors - 0](../reports/errors.md)
* [Markers - 0](../reports/markers.md)
* [Deprecated - 13](../reports/deprecated.md)

---

This document was automatically generated from source code comments on 2022-04-22 using [phpDocumentor](http://www.phpdoc.org/)

&copy; 2022 YooMoney